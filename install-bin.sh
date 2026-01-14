#!/bin/bash

# change to the directory in which this script is located
pushd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit 1

# ===------ BEGIN ------===

# OVERVIEW
# This script updates shell configuration file (.bashrc or .zshrc) to add chouti-shell bin to $PATH for future shell sessions.

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
  echo "🛑 $user_friendly_bin_path doesn't exist. Can't add it to \$PATH." >&2
  exit 1
fi

# skip interactive prompt in CI environments
if [[ -n "${CI:-}" || -n "${GITHUB_ACTIONS:-}" || -n "${CONTINUOUS_INTEGRATION:-}" ]]; then
  echo "ℹ️  Running in CI environment. Skipping PATH modification in $shell_config_file."
  echo "💡 The PATH can be set directly in your CI workflow if needed:"
  echo "   export PATH=\"$user_friendly_bin_path:\$PATH\""
  exit 0
fi

if [[ $SHELL == *"bash"* ]]; then
  shell_config_file=~/.bashrc
elif [[ $SHELL == *"zsh"* ]]; then
  shell_config_file=~/.zshrc
else
  echo "🛑 Unsupported shell: $SHELL." >&2
  exit 1
fi

path_content_to_add="export PATH=\"$user_friendly_bin_path:\$PATH\""

if grep -q "$path_content_to_add" "$shell_config_file"; then
  echo "✅ $user_friendly_bin_path already exists \$PATH in $shell_config_file."
  exit 0
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
  echo "$path_content_to_add"
} >>"$shell_config_file"
clear-line
echo "✅ Added $user_friendly_bin_path to \$PATH in $shell_config_file.. Restart your terminal to take effect."

# ===------ END ------===

# return to whatever directory we were in when this script was run
popd >/dev/null 2>&1 || exit 0
