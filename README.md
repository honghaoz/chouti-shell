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

### Use binaries

Just execute the binaries in `~/.chouti-shell/bin`:

For example, to use `swift-build`, run:

```bash
swift-build --arch arm64 --install usr/local/bin
```

### Use shell library

1. Add the following lines to the top of your shell script:

    ```bash
    #!/bin/bash

    # shellcheck disable=SC1091
    source "$HOME/.chouti-shell/lib.sh" || exit 1
    ```

2. Use utility functions in your script, such as `prompt`:

    ```bash
    reply=""
    prompt "Do you want to continue?" "reply=\"y\"" "reply=\"n\"" "reply=\"n\""

    if [[ "$reply" == "y" ]]; then
        to continue...
    else
        to exit...
    fi
    ```
