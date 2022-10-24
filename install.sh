#!/bin/bash

# change to the directory in which this script is located
pushd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit 1

# ===------ BEGIN ------===

# OVERVIEW
# This script installs shell-lib into /usr/local/lib

# make /usr/local/lib dir if needed.
if [[ ! -d /usr/local/lib ]]; then
  echo "➡️  Make /usr/local/lib..."
  sudo mkdir -p /usr/local/lib && echo "Created /usr/local/lib"
fi

# create symbolic links for shell-lib
# 
# if is normal folder, give out warings
#   if is symlink, check if it is pointing to the right place
#     if is not pointing to the right place, give out warings
#     if is pointing to the right place, do nothing
# no folder, make one

CURRENT_DIR=$(pwd)

DESTINATION_DIR="$CURRENT_DIR/shell-lib"
SYMLINK_DIR="/usr/local/lib/shell-lib"

if [[ -d "$SYMLINK_DIR" ]]; then
  if [[ -L "$SYMLINK_DIR" ]]; then
    # is symlink
    # SYMLINK_TARGET=$(readlink "$SYMLINK_DIR")
    SYMLINK_TARGET=$(ls -l $SYMLINK_DIR | awk '{print $NF}')
    if [[ $SYMLINK_TARGET == "$DESTINATION_DIR" ]]; then
      # already linked
      echo "✅ shell-lib is already installed."
    else
      # different link
      echo "🛑 $SYMLINK_DIR already exists. It is a symlink pointing to $SYMLINK_TARGET. Can't install shell-lib."
    fi
  else
    # is normal folder
    echo "🛑 $SYMLINK_DIR already exists. It is a normal folder. Can't install shell-lib."
  fi
else
  # no folder
  echo "➡️  Install shell-lib..."
  
  # check if there's sudo privilege
  if sudo -n true 2>/dev/null; then
    sudo ln -s "$DESTINATION_DIR" "$SYMLINK_DIR"
  else
    echo "Will execute: ln -s $DESTINATION_DIR $SYMLINK_DIR"
    sudo ln -s "$DESTINATION_DIR" "$SYMLINK_DIR"
  fi

  # shellcheck disable=SC2181
  if [[ $? -eq 0 ]]; then
    echo "✅ Made a symbolic link: $SYMLINK_DIR -> $DESTINATION_DIR"
  else
    echo "🛑 Failed to install shell-lib."
  fi
fi

# ===------ END ------===

# return to whatever directory we were in when this script was run
popd >/dev/null 2>&1 || exit 0
