#!/bin/bash

# OVERVIEW:
# This file defines functions to print colored text in terminal.

# Save the current state of 'errexit'
[[ $- == *e* ]] && ERREXIT_SET=1 || ERREXIT_SET=0

set +e # disable 'errexit' since tput dim may return 1

# define colors if TERM is good to handle them
if [[ -t 1 ]]; then
  NORMAL=$(tput sgr0)

  BOLD=$(tput bold)
  DIM=$(tput dim)
  UNDERLINE=$(tput smul)
  BLINK=$(tput blink)
  REVERSE=$(tput rev)
  HIDDEN=$(tput invis)

  BLACK=$(tput setaf 0)
  RED=$(tput setaf 1)
  GREEN=$(tput setaf 2)
  YELLOW=$(tput setaf 3)
  BLUE=$(tput setaf 4)
  MEGENTA=$(tput setaf 5)
  CYAN=$(tput setaf 6)
  WHITE=$(tput setaf 7)
  LIGHTGRAY=$(tput setaf 8)

  BG_BLACK=$(tput setab 0)
  BG_RED=$(tput setab 1)
  BG_GREEN=$(tput setab 2)
  BG_YELLOW=$(tput setab 3)
  BG_BLUE=$(tput setab 4)
  BG_MEGENTA=$(tput setab 5)
  BG_CYAN=$(tput setab 6)
  BG_WHITE=$(tput setab 7)
  BG_LIGHTGRAY=$(tput setab 8)
else
  NORMAL=""

  BOLD=""
  DIM=""
  UNDERLINE=""
  BLINK=""
  REVERSE=""
  HIDDEN=""

  BLACK=""
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  MEGENTA=""
  CYAN=""
  WHITE=""
  LIGHTGRAY=""

  BG_BLACK=""
  BG_RED=""
  BG_GREEN=""
  BG_YELLOW=""
  BG_BLUE=""
  BG_MEGENTA=""
  BG_CYAN=""
  BG_WHITE=""
  BG_LIGHTGRAY=""
fi

# restore 'errexit' if it was set
[[ $ERREXIT_SET == 1 ]] && set -e

# echo

function echo-bold {
  echo "${BOLD}$1${NORMAL}"
}

function echo-dim {
  echo "${DIM}$1${NORMAL}"
}

function echo-underline {
  echo "${UNDERLINE}$1${NORMAL}"
}

function echo-blink {
  echo "${BLINK}$1${NORMAL}"
}

function echo-reverse {
  echo "${REVERSE}$1${NORMAL}"
}

function echo-hidden {
  echo "${HIDDEN}$1${NORMAL}"
}

function echo-black {
  echo "${BLACK}$1${NORMAL}"
}

function echo-red {
  echo "${RED}$1${NORMAL}"
}

function echo-green {
  echo "${GREEN}$1${NORMAL}"
}

function echo-yellow {
  echo "${YELLOW}$1${NORMAL}"
}

function echo-blue {
  echo "${BLUE}$1${NORMAL}"
}

function echo-magenta {
  echo "${MEGENTA}$1${NORMAL}"
}

function echo-cyan {
  echo "${CYAN}$1${NORMAL}"
}

function echo-white {
  echo "${WHITE}$1${NORMAL}"
}

function echo-lightgray {
  echo "${LIGHTGRAY}$1${NORMAL}"
}

# print without the trailing newline

function print-bold {
  echo -n "${BOLD}$1${NORMAL}"
}

function print-dim {
  echo -n "${DIM}$1${NORMAL}"
}

function print-underline {
  echo -n "${UNDERLINE}$1${NORMAL}"
}

function print-blink {
  echo -n "${BLINK}$1${NORMAL}"
}

function print-reverse {
  echo -n "${REVERSE}$1${NORMAL}"
}

function print-hidden {
  echo -n "${BLACK}$1${NORMAL}"
}

function print-black {
  echo -n "${RED}$1${NORMAL}"
}

function print-red {
  echo -n "${GREEN}$1${NORMAL}"
}

function print-green {
  echo -n "${YELLOW}$1${NORMAL}"
}

function print-yellow {
  echo -n "${BLUE}$1${NORMAL}"
}

function print-blue {
  echo -n "${MEGENTA}$1${NORMAL}"
}

function print-magenta {
  echo -n "${CYAN}$1${NORMAL}"
}

function print-cyan {
  echo -n "${WHITE}$1${NORMAL}"
}

function print-white {
  echo -n "${LIGHTGRAY}$1${NORMAL}"
}

# print all colors
function print-colors() {
  echo "NORMAL"
  echo "${BOLD}BOLD${NORMAL}\t\t\${BOLD}BOLD\${NORMAL}"
  echo "${DIM}DIM${NORMAL}\t\t\${DIM}DIM\${NORMAL}"
  echo "${UNDERLINE}UNDERLINE${NORMAL}\t\${UNDERLINE}UNDERLINE\${NORMAL}"
  echo "${BLINK}BLINK${NORMAL}\t\t\${BLINK}BLINK\${NORMAL}"
  echo "${REVERSE}REVERSE${NORMAL}\t\t\${REVERSE}REVERSE\${NORMAL}"
  echo "${HIDDEN}HIDDEN${NORMAL}\t\t\${HIDDEN}HIDDEN\${NORMAL}"

  echo ""

  echo "${BLACK}BLACK${NORMAL}\t\t\${BLACK}BLACK\${NORMAL}"
  echo "${LIGHTGRAY}LIGHTGRAY${NORMAL}\t\${LIGHTGRAY}LIGHTGRAY\${NORMAL}"
  echo "${WHITE}WHITE${NORMAL}\t\t\${WHITE}WHITE\${NORMAL}"
  echo "${RED}RED${NORMAL}\t\t\${RED}RED\${NORMAL}"
  echo "${GREEN}GREEN${NORMAL}\t\t\${GREEN}GREEN\${NORMAL}"
  echo "${YELLOW}YELLOW${NORMAL}\t\t\${YELLOW}YELLOW\${NORMAL}"
  echo "${BLUE}BLUE${NORMAL}\t\t\${BLUE}BLUE\${NORMAL}"
  echo "${MEGENTA}MEGENTA${NORMAL}\t\t\${MEGENTA}MEGENTA\${NORMAL}"
  echo "${CYAN}CYAN${NORMAL}\t\t\${CYAN}CYAN\${NORMAL}"
  
  echo ""

  echo "${BG_BLACK}BG_BLACK${NORMAL}\t\${BG_BLACK}BG_BLACK\${NORMAL}"
  echo "${BG_LIGHTGRAY}BG_LIGHTGRAY${NORMAL}\t\${BG_LIGHTGRAY}BG_LIGHTGRAY\${NORMAL}"
  echo "${BG_WHITE}${BLACK}BG_WHITE${NORMAL}\t\${BG_WHITE}\${BLACK}BG_WHITE\${NORMAL}"
  echo "${BG_RED}BG_RED${NORMAL}\t\t\${BG_RED}BG_RED\${NORMAL}"
  echo "${BG_GREEN}BG_GREEN${NORMAL}\t\${BG_GREEN}BG_GREEN\${NORMAL}"
  echo "${BG_YELLOW}BG_YELLOW${NORMAL}\t\${BG_YELLOW}BG_YELLOW\${NORMAL}"
  echo "${BG_BLUE}BG_BLUE${NORMAL}\t\t\${BG_BLUE}BG_BLUE\${NORMAL}"
  echo "${BG_MEGENTA}BG_MEGENTA${NORMAL}\t\${BG_MEGENTA}BG_MEGENTA\${NORMAL}"
  echo "${BG_CYAN}BG_CYAN${NORMAL}\t\t\${BG_CYAN}BG_CYAN\${NORMAL}"
}

# References:
# https://linux.101hacks.com/ps1-examples/prompt-color-using-tput/