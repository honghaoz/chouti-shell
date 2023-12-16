#!/bin/bash

# change to the directory in which this script is located
pushd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit 1

# ===------ BEGIN ------===

# OVERVIEW
# This script installs chouti (shell lib) into /usr/local/lib

set -e # exit immediately if a command exits with a non-zero status.

./install-lib.sh
./install-bin.sh

# ===------ END ------===

# return to whatever directory we were in when this script was run
popd >/dev/null 2>&1 || exit 0
