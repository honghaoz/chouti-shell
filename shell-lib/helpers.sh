#!/bin/bash

# Clears current line.
function clearLine() {
  printf '\033[1A\033[K'
}

# Check if a command exists.
function commandExists() {
  [ -x "$(command -v "$1")" ];
}

# Run command by printing the command and its result.
# Example:
#   runCommand "ls -l"
function runCommand() {
  commandToRun=$*
  echo "➜ $commandToRun"

  # eval "$commandToRun"
  if $commandToRun; 
  then
    echo "${COLOR_GREEN}✔${COLOR_RESET} $commandToRun"
  else
    echo "${COLOR_RED}✖${COLOR_RESET} $commandToRun"
    exit 1
  fi
  echo ""
}

# Ask for confirmation before proceeding.
function promptBeforeRun() {
  PROMPT="$1"
  COMMAND="$2"
  FALLBACK="$3"

  ANSWER_COUNT=0
  while true; do
    echo -n "➡️  $PROMPT [y/n] "
    read -r -n 1 answer
    ANSWER_COUNT=$((ANSWER_COUNT + 1))
    if [[ $ANSWER_COUNT -eq 5 ]]; then
      if [[ $answer != "" ]]; then
        echo ""
      fi
      echo -e "⚠️  ${COLOR_YELLOW}Too many attempts. Skipping.${COLOR_RESET}"
      if [[ -n "$FALLBACK" ]]; then
        eval "$FALLBACK"
      fi
      break
    fi

    case $answer in
      [Yy]* )
        echo ""
        eval "$COMMAND"
        break
        ;;
      [Nn]* )
        echo ""
        if [[ -n "$FALLBACK" ]]; then
          eval "$FALLBACK"
        fi
        break
        ;;
      "" )
        # user typed newline, no need to print newline
        echo "💡 Please answer yes or no.";;
      * )
        echo "" # user typed other char, put a newline before print new info
        echo "💡 Please answer yes or no."
        ;;
    esac
  done
}

# Pause the script and wait for user to press enter.
function pause() {
  PROMPT="$1"
  read -r -p "➡️  $PROMPT" key
}

# Get the absolute path from a relative path.
# If there's no argument, use current directory.
function absolutePath() {
  if [[ -d "$1" ]]; then
    currentPath="$(pwd)" # save current path
    cd "$1" || exit 1 # cd to the checking dir
    pwd
    cd "$currentPath" || exit 1 # restore to original path
  else
    echo "$(cd "$(dirname "$1")" && pwd -P)/$(basename "$1")"
  fi
}

# Get absolute path
# Example:
#   - `absolutePath2 .`
# References:
#   - https://stackoverflow.com/a/51264222/3164091
#   - https://stackoverflow.com/a/31605674/3164091
function absolutePath2 {
  local target="$1"
  if [[ "$target" == "." ]]; then
    pwd
  elif [[ "$target" == ".." ]]; then
    dirname "$(pwd)"
  else
    echo "$(cd "$(dirname "$1")" || exit; pwd)/$(basename "$1")"
  fi
}

# Get a rotated filename.
# Example:
#   rotatedFilePath "$HOME/Library/Spelling/LocalDictionary" "-backup"
#   NEW_FILE_PATH=$(rotatedFilePath "$HOME/Library/Spelling/LocalDictionary" "-backup")
function rotatedFilePath() {
  FILE_PATH=$1
  SUFFIX=$2
  NEW_FILE_PATH="$FILE_PATH${SUFFIX}1"
  while [[ -f $NEW_FILE_PATH ]]; do
    NEXT_NUMBER=$(($(echo "$NEW_FILE_PATH" | sed -e "s/^.*${SUFFIX}//" -e "s/\.\w*$//") + 1))
    # add 1 to number
    NEW_FILE_PATH="$FILE_PATH${SUFFIX}$NEXT_NUMBER"
  done
  echo "$NEW_FILE_PATH"
}

# Make a symbolic link with backup.
# Example:
#   makeSymbolicLink "$HOME/.tmux.conf" "$dotfilesPath/tmux/tmux.conf" 
function makeSymbolicLink() {
  TARGET_FILE_PATH=$1 # the symbolic link file
  SOURCE_FILE_PATH=$2 # the file to link to, aka destination

  # if source file doesn't exist, skip
  if [[ ! -e "$SOURCE_FILE_PATH" ]]; then
    echo "⚠️  Source file doesn't exist: $SOURCE_FILE_PATH"
    return
  fi

  if [[ -e "$TARGET_FILE_PATH" && ! -L "$TARGET_FILE_PATH" ]]; then
    # is regular file or dir
    BACKUP_PATH=$(rotatedFilePath "$TARGET_FILE_PATH" "-backup")
    echo "Rename '$TARGET_FILE_PATH' to '$BACKUP_PATH'"
    mv "$TARGET_FILE_PATH" "$BACKUP_PATH"
  fi

  SHOULD_CREATE_LINK=true
  if [[ -L "$TARGET_FILE_PATH" ]]; then
    # already have symlink
    LINK_TARGET_PATH=$(ls -l $TARGET_FILE_PATH | awk '{print $NF}')
    if [[ $LINK_TARGET_PATH == "$SOURCE_FILE_PATH" ]]; then
      # already linked
      SHOULD_CREATE_LINK=false
    else
      # different link
      BACKUP_PATH=$(rotatedFilePath "$TARGET_FILE_PATH" "-backup")
      echo "Rename '$TARGET_FILE_PATH' to '$BACKUP_PATH'"
      mv "$TARGET_FILE_PATH" "$BACKUP_PATH"
    fi
  fi

  if [[ $SHOULD_CREATE_LINK == true ]]; then
    # create intermediate directories if needed
    if [[ ! -d "$(dirname "$TARGET_FILE_PATH")" ]]; then
      echo "Creating directory: $(dirname "$TARGET_FILE_PATH")"
      mkdir -p "$(dirname "$TARGET_FILE_PATH")" || return
    fi
    # create symlink
    echo "Making symlink: $TARGET_FILE_PATH -> $SOURCE_FILE_PATH"
    ln -s "$SOURCE_FILE_PATH" "$TARGET_FILE_PATH"
  else
    echo "✅ Already linked: ${COLOR_CYAN}$TARGET_FILE_PATH${COLOR_RESET} -> $SOURCE_FILE_PATH"
  fi
}
