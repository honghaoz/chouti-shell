#!/bin/bash

# change to the directory in which this script is located
pushd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit 1

# ===------ BEGIN ------===

# OVERVIEW
# This script adds chouti-shell bin to $PATH

set -e # exit immediately if a command exits with a non-zero status.

# shellcheck disable=SC1091
source "./lib/utilities.sh" || exit 1

bin_path=$(pwd)/bin
# if bin_path under home dir, use $HOME instead of absolute path
user_friendly_bin_path=$bin_path
if [[ $bin_path == "$HOME"* ]]; then
  user_friendly_bin_path="\$HOME${bin_path#"$HOME"}"
fi

# make sure bin path exist
if [[ ! -d "$bin_path" ]]; then
  echo "🛑 $user_friendly_bin_path doesn't exist. Can't add it to \$PATH."
  exit 1
fi

# check if bin path is already in $PATH
if [[ ":$PATH:" == *":$PWD/bin:"* ]]; then
  echo "✅ $user_friendly_bin_path is already in \$PATH."
  exit 0
fi

if [[ $SHELL == *"bash"* ]]; then
  shell_config_file=~/.bashrc
elif [[ $SHELL == *"zsh"* ]]; then
  shell_config_file=~/.zshrc
else
  echo "🛑 Unsupported shell: $SHELL."
  exit 1
fi

echo "You can manuallly add $user_friendly_bin_path to \$PATH by adding following lines to your shell config file ($shell_config_file):"
echo ""
echo "# chouti-shell"
echo "export PATH=\"$user_friendly_bin_path:\$PATH\""
echo ""

prompt "Do you want to add $user_friendly_bin_path to \$PATH in $shell_config_file ?" || exit 0

echo "➡️  Adding $user_friendly_bin_path to \$PATH... in $shell_config_file"
{
  echo ""
  echo "# chout-shell"
  echo "export PATH=\"$bin_path:\$PATH\""
} >> "$shell_config_file"
clear-line
echo "✅ Added $user_friendly_bin_path to \$PATH. Restart your terminal to take effect."

# ===------ END ------===

# return to whatever directory we were in when this script was run
popd >/dev/null 2>&1 || exit 0
