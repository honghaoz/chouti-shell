# chouti-shell

Shell library and binaries.

## Installation

1. Clone this repo to `~/.chouti-shell`:

    ```bash
    git clone https://github.com/honghaoz/chouti-shell.git ~/.chouti-shell
    ```

2. Run `install.sh` to install binaries.

    ```bash
    ~/.chouti-shell/install.sh
    ```

    This will add `~/.chouti-shell/bin` to your `PATH` environment variable.

## Usage

1. Add the following lines to the top of your shell script:

    ```bash
    # shellcheck disable=SC1091
    source "$HOME/.chouti-shell/lib/lib.sh" || exit 1
    ```

2. Use utility functions in your script, such as `prompt`:
    ```bash
    #!/bin/bash

    # shellcheck disable=SC1091
    source "$HOME/.chouti-shell/lib/lib.sh" || exit 1

    prompt "Are you sure you want to continue?" "echo 'Yes'" "echo 'No'" "echo 'Too many attempts'"
    ```
