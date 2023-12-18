#!/bin/bash

# Clear the current line in terminal.
function clear-line() {
  printf '\033[1A\033[K'
}

# Check if a command exists.
# - Return: 0 if command exists, 1 otherwise.
# - Example:
#   if command-exists "brew"; then echo "brew exists"; fi
function command-exists() {
  [ -x "$(command -v "$1")" ];
}

# Run command by printing the command and the execution result.
# - Examples:
#   run-command "ls -l"
#   run-command less ~/.zshrc
function run-command() {
  commandToRun=$*
  # echo "➜ $commandToRun"
  echo "➡️  $commandToRun"

  if eval "$commandToRun";
  then
    # echo "${GREEN}✔${NORMAL} $commandToRun"
    echo "✅ $commandToRun"
  else
    # echo "${RED}✖${NORMAL} $commandToRun"
    echo "❌ $commandToRun"
  fi
}

# Prompt before running a command.
# - Arguments:
#   - $1: Prompt message.
#   - $2: [optional] Command to run if user answers yes.
#   - $3: [optional] Command to run if user answers no.
#   - $4: [optional] Command to run if user fails to answer after 3 attempts.
# - Examples:
#   prompt "Do you want to run 'ls -l'?" "ls -l"
#   prompt "Do you want to run 'ls -l'?" "ls -l" "ls"
#   prompt "Do you want to run 'ls -l'?" "ls -l" "ls" "ls -all"
#   reply=""; prompt "Do you want to continue?" "reply=\"y\"" "reply=\"n\"" "reply=\"n\""
function prompt() {
  if [[ $# == 0 ]]; then
    echo "prompt: Must provide prompt message."
    return 1
  fi
  if [[ $# -gt 4 ]]; then
    echo "prompt: Too many arguments: $#"
    return 1
  fi

  local PROMPT="$1"
  local YES_COMMAND="$2"
  local NO_COMMAND="$3"
  local SKIP_COMMAND="$4"

  local REPLY_COUNT=0
  while [[ $REPLY_COUNT -lt 3 ]]; do
    echo -n "❓ $PROMPT [y/n] "
    # shellcheck disable=SC2155
    local REPLY=$(bash -c 'read -r -n 1; echo $REPLY')

    case $REPLY in
      [Yy]* )
        echo ""
        eval "$YES_COMMAND"
        break
        ;;
      [Nn]* )
        echo ""
        if [[ -n "$NO_COMMAND" ]]; then
          eval "$NO_COMMAND"
        fi
        break
        ;;
      "" )
        # user typed newline, no need to print newline
        echo "💡 Please answer y (yes) or n (no)."
        ;;
      * )
        echo "" # user typed other char, put a newline before print new info
        echo "💡 Please answer y (yes) or n (no)."
        ;;
    esac

    REPLY_COUNT=$((REPLY_COUNT + 1))
  done

  if [[ $REPLY_COUNT -eq 3 ]]; then
    clear-line
    echo -e "⚠️  ${YELLOW}Too many attempts.${NORMAL}"
    if [[ -n "$SKIP_COMMAND" ]]; then
      eval "$SKIP_COMMAND"
    fi
  fi
}

# Pause the script and wait for user to press enter.
# - Arguments:
#   - $1: [optional] Prompt message.
# - Example:
#   pause "Press any key to continue..."
function pause() {
  # check there's no argument or exactly 1 argument
  if [[ $# -ne 0 && $# -ne 1 ]]; then
    echo "pause: Invalid number of arguments: $#"
    return 1
  fi
  # read prompt from argument
  local PROMPT="$1"
  # if no prompt
  if [[ -z "$PROMPT" ]]; then
    echo -n "[Press any key to continue]"
  else
    echo -n "➡️  $PROMPT"
  fi
  bash -c 'read -r -n 1'
}

# Check the architecture type of a binary file.
# - Arguments:
#   - $1: Path to the binary file.
# - Example:
#   check-bin-arch-type /usr/local/bin/ls
function check-bin-arch-type() {
  # References:
  # - https://developer.apple.com/documentation/xcode/building_a_universal_macos_binary
  command lipo -archs "$1"
}
