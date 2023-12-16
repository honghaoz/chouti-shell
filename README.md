# chouti-shell
Shell library and binaries.

## Installation
1. Clone this repo to your local machine.

    For example, clone this repo to `~/.chouti-shell`:
    ```bash
    git clone https://github.com/honghaoz/chouti-shell.git ~/.chouti-shell
    ```

2. Run `install-lib.sh` to install the library.

    ```bash
    ~/.chouti-shell/install-lib.sh
    ```

    This will create a symlink at `/usr/local/lib/chouti` pointing to `~/.chouti-shell/lib`.

3. Run `install-bin.sh` to install the binaries.

    ```bash
    ~/.chouti-shell/install-bin.sh
    ```

    This will add `~/.chouti-shell/bin` to your `PATH` environment variable.

# Usage

1. Add the following lines to the top of your shell script:

    ```bash
    # shellcheck disable=SC1091
    source "/usr/local/lib/chouti/lib.sh" || exit 1
    ```

2. Use utility functions in your script, such as `run-command`:
    ```bash
    #!/bin/bash

    # shellcheck disable=SC1091
    source "/usr/local/lib/chouti/lib.sh" || exit 1

    run-command "echo 'hello world'"
    ```
