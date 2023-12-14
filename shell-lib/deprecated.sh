#!/bin/bash

# Get the absolute path from a relative path.
# If there's no argument, use current directory.
function absolute-path() {
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
function absolute-path2 {
  local target="$1"
  if [[ "$target" == "." ]]; then
    pwd
  elif [[ "$target" == ".." ]]; then
    dirname "$(pwd)"
  else
    echo "$(cd "$(dirname "$1")" || exit; pwd)/$(basename "$1")"
  fi
}
