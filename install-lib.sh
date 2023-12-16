#!/bin/bash

# change to the directory in which this script is located
pushd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit 1

# ===------ BEGIN ------===

# OVERVIEW
# This script installs chouti (shell lib) into /usr/local/lib

set -e # exit immediately if a command exits with a non-zero status.

# shellcheck disable=SC1091
source "./lib/utilities.sh" || exit 1

# make /usr/local/lib dir if needed.
if [[ ! -d /usr/local/lib ]]; then
  echo "➡️  Make /usr/local/lib..."
  sudo mkdir -p /usr/local/lib && echo "Created /usr/local/lib"
fi

# create symbolic links for chouti
# 
# if is normal folder, give out warings
#   if is symlink, check if it is pointing to the right place
#     if is not pointing to the right place, give out warings
#     if is pointing to the right place, do nothing
# no folder, make one

CURRENT_DIR=$(pwd)

LIB_NAME="chouti (shell lib)"
DESTINATION_DIR="$CURRENT_DIR/lib"
SYMLINK_DIR="/usr/local/lib/chouti"

if [[ -L "$SYMLINK_DIR" ]]; then
  # is symlink
  set +e # temporarily disable exit on non-zero status
  SYMLINK_TARGET=$(readlink -f "$SYMLINK_DIR")
  set -e
  if [[ $SYMLINK_TARGET == "$DESTINATION_DIR" ]]; then
    # already linked
    echo "✅ $LIB_NAME is already installed."
  else
    # different link
    echo "🛑 $SYMLINK_DIR already exists. It is a symlink pointing to $SYMLINK_TARGET. Can't install $LIB_NAME."
  fi
elif [[ -d "$SYMLINK_DIR" ]]; then
  # is normal folder
  echo "🛑 $SYMLINK_DIR already exists. It is a normal folder. Can't install $LIB_NAME."
elif [[ -e "$SYMLINK_DIR" ]]; then
  # is file
  echo "🛑 $SYMLINK_DIR already exists. It is a file. Can't install $LIB_NAME."
else
  # no folder
  echo "➡️  Install $LIB_NAME..."
  
  # check if there's sudo privilege
  if sudo -n true 2>/dev/null; then
    sudo ln -s "$DESTINATION_DIR" "$SYMLINK_DIR"
  else
    echo "➡️  Executing: ln -s $DESTINATION_DIR $SYMLINK_DIR"
    sudo ln -s "$DESTINATION_DIR" "$SYMLINK_DIR"
    clear-line
  fi

  # shellcheck disable=SC2181
  if [[ $? -eq 0 ]]; then
    echo "✅ $LIB_NAME installed successfully. Made a symbolic link: $SYMLINK_DIR -> $DESTINATION_DIR"
  else
    echo "🛑 Failed to install $LIB_NAME."
  fi
fi

# ===------ END ------===

# return to whatever directory we were in when this script was run
popd >/dev/null 2>&1 || exit 0
