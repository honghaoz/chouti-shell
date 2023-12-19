#!/bin/bash

# avoid overwriting the original SCRIPT_DIR
original_script_path="$SCRIPT_DIR"

if [[ -n "$BASH_VERSION" ]]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
elif [[ -n "$ZSH_VERSION" ]]; then
  # https://stackoverflow.com/questions/18810483/what-is-the-zsh-equivalent-of-a-bash-script-getting-the-scripts-directory
  SCRIPT_DIR=${0:a:h}
else
  echo "🛑 Unsupported shell: $SHELL."
  exit 1
fi

# shellcheck disable=SC1091
source "${SCRIPT_DIR}/colors.sh"

# shellcheck disable=SC1091
source "${SCRIPT_DIR}/utilities.sh"

SCRIPT_DIR="$original_script_path"
unset original_script_path
