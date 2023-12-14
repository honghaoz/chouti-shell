# shell-lib
Shell helpers and binaries.

## Installation
1. Clone this repo to your local machine.

    For example, clone this repo to `~/.shell-lib`:
    ```bash
    git clone https://github.com/honghaoz/shell-lib.git ~/.shell-lib
    ```

2. Run `install.sh` to install.

    ```bash
    ~/.shell-lib/install.sh
    ```

    This will create a symlink at `/usr/local/lib/shell-lib` pointing to `~/.shell-lib/shell-lib`.
    
# Usage

1. Add the following lines to the top of your shell script:
    ```bash
    # shellcheck disable=SC1091
    source "/usr/local/lib/shell-lib/lib.sh" || exit 1
    ```

2. Use functions in your scripts. For example:
    ```bash
    #!/bin/bash

    # shellcheck disable=SC1091
    source "/usr/local/lib/shell-lib/lib.sh" || exit 1

    run-command "echo 'hello world'"
    ```
