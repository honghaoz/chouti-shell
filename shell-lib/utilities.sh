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
# - Exit: 0 if user answers yes, 1 otherwise.
# - Examples:
#   prompt "Do you want to run 'ls -l'?" "ls -l"
#   prompt "Do you want to run 'ls -l'?" "ls -l" "ls"
#   prompt "Do you want to run 'ls -l'?" "ls -l" "ls" "ls -all"
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

  local REPLIED_YES=false

  local REPLY_COUNT=0
  while [[ $REPLY_COUNT -lt 3 ]]; do
    echo -n "➡️  $PROMPT [y/n] "
    # shellcheck disable=SC2155
    local REPLY=$(bash -c 'read -r -n 1; echo $REPLY')

    case $REPLY in
      [Yy]* )
        echo ""
        eval "$YES_COMMAND"
        REPLIED_YES=true
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

  if [[ $REPLIED_YES == true ]]; then
    return 0
  else
    return 1
  fi
}

# Pause the script and wait for user to press enter.
# - Arguments:
#   - $1: [optional] Prompt message.
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
    echo -n "[Press Enter to continue]"
  else
    echo -n "➡️  $PROMPT [Press Enter to continue]"
  fi
  bash -c 'read -r -n 1'
}

# Get a rotated path with a suffix.
# - Arguments:
#   - $1: Path to rotate.
#   - $2: [optional] Suffix to add.
# - Return: Rotated path.
# - Example:
#   rotate-path "$HOME/Library/Spelling/LocalDictionary" "-backup"
#   NEXT_PATH=$(rotate-path "$HOME/Library/Spelling/LocalDictionary" "-backup")
function rotate-path() {
  if [[ $# -ne 1 && $# -ne 2 ]]; then
    echo "rotated-path: Invalid number of arguments: $#"
    return 1
  fi
  local PATH=$1
  local SUFFIX=$2
  local NEXT_PATH="$PATH$SUFFIX"
  if [[ ! -e $NEXT_PATH ]]; then
    echo "$NEXT_PATH"
    return 0
  fi

  local NUMBER=1
  local NEXT_PATH="$PATH$SUFFIX$NUMBER"
  while [[ -e $NEXT_PATH ]]; do
    NUMBER=$((NUMBER + 1))
    NEXT_PATH="$PATH$SUFFIX$NUMBER"
  done
  echo "$NEXT_PATH"
}
