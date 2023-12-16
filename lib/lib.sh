#!/bin/bash

# get the directory of the script for zsh and bash
if [[ -n "$BASH_VERSION" ]]; then
  SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
elif [[ -n "$ZSH_VERSION" ]]; then
  # shellcheck disable=SC2296
  SCRIPT_DIR="$( cd "$( dirname "${(%):-%N}" )" >/dev/null 2>&1 && pwd )"
else
  echo "🛑 Unsupported shell: $SHELL."
  exit 1
fi

# shellcheck disable=SC1091
source "${SCRIPT_DIR}/colors.sh"

# shellcheck disable=SC1091
source "${SCRIPT_DIR}/utilities.sh"
