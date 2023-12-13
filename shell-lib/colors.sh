#!/bin/bash

# https://linux.101hacks.com/ps1-examples/prompt-color-using-tput/

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

# echo

function echoBold {
  echo "${BOLD}$1${NORMAL}"
}

function echoDim {
  echo "${DIM}$1${NORMAL}"
}

function echoUnderline {
  echo "${UNDERLINE}$1${NORMAL}"
}

function echoBlink {
  echo "${BLINK}$1${NORMAL}"
}

function echoReverse {
  echo "${REVERSE}$1${NORMAL}"
}

function echoHidden {
  echo "${HIDDEN}$1${NORMAL}"
}

function echoBlack {
  echo "${BLACK}$1${NORMAL}"
}

function echoRed {
  echo "${RED}$1${NORMAL}"
}

function echoGreen {
  echo "${GREEN}$1${NORMAL}"
}

function echoYellow {
  echo "${YELLOW}$1${NORMAL}"
}

function echoBlue {
  echo "${BLUE}$1${NORMAL}"
}

function echoMagenta {
  echo "${MEGENTA}$1${NORMAL}"
}

function echoCyan {
  echo "${CYAN}$1${NORMAL}"
}

function echoWhite {
  echo "${WHITE}$1${NORMAL}"
}

function echoLightGray {
  echo "${LIGHTGRAY}$1${NORMAL}"
}

# print without the trailing newline

function printBold {
  echo -n "${BOLD}$1${NORMAL}"
}

function printDim {
  echo -n "${DIM}$1${NORMAL}"
}

function printUnderline {
  echo -n "${UNDERLINE}$1${NORMAL}"
}

function printBlink {
  echo -n "${BLINK}$1${NORMAL}"
}

function printReverse {
  echo -n "${REVERSE}$1${NORMAL}"
}

function printBlack {
  echo -n "${BLACK}$1${NORMAL}"
}

function printRed {
  echo -n "${RED}$1${NORMAL}"
}

function printGreen {
  echo -n "${GREEN}$1${NORMAL}"
}

function printYellow {
  echo -n "${YELLOW}$1${NORMAL}"
}

function printBlue {
  echo -n "${BLUE}$1${NORMAL}"
}

function printMagenta {
  echo -n "${MEGENTA}$1${NORMAL}"
}

function printCyan {
  echo -n "${CYAN}$1${NORMAL}"
}

function printWhite {
  echo -n "${WHITE}$1${NORMAL}"
}

function printLightGray {
  echo -n "${LIGHTGRAY}$1${NORMAL}"
}

# print all colors
function printColors() {
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
