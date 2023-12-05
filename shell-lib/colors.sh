#!/bin/bash

export COLOR_RESET=$'\e[0m'

export COLOR_BOLD=$'\e[1m'
export COLOR_UNDERLINED=$'\e[4m'
export COLOR_BLINK=$'\e[5m'
export COLOR_REVERSE=$'\e[7m'

# Foreground Color
export COLOR_BLACK=$'\e[30m'
export COLOR_RED=$'\e[31m'
export COLOR_GREEN=$'\e[32m'
export COLOR_BROWN=$'\e[33m'
export COLOR_BLUE=$'\e[34m'
export COLOR_PURPLE=$'\e[35m'
export COLOR_CYAN=$'\e[36m'
export COLOR_LIGHTGRAY=$'\e[37m'
export COLOR_YELLOW=$'\e[33m'

# Background Color
export COLOR_BLACK_U=$'\e[40m'
export COLOR_RED_U=$'\e[41m'
export COLOR_GREEN_U=$'\e[42m'
export COLOR_BROWN_U=$'\e[43m'
export COLOR_BLUE_U=$'\e[44m'
export COLOR_PURPLE_U=$'\e[45m'
export COLOR_CYAN_U=$'\e[46m'
export COLOR_LIGHTGRAY_U=$'\e[47m'

# define colors if TERM is good to handle them
if [[ -t 1 ]]; then
  BOLD=$(tput bold)
  BLACK=$(tput setaf 0)
  RED=$(tput setaf 1)
  GREEN=$(tput setaf 2)
  YELLOW=$(tput setaf 3)
  BLUE=$(tput setaf 4)
  MEGENTA=$(tput setaf 5)
  CYAN=$(tput setaf 6)
  WHITE=$(tput setaf 7)
  NORMAL=$(tput sgr0)
else
  BOLD=""
  BLACK=""
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  MEGENTA=""
  CYAN=""
  WHITE=""
  NORMAL=""
fi

# echo

# Example: echoBold "Hello World"
function echoBold {
  echo "${BOLD}$1${NORMAL}"
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

function echoBlack {
  echo "${BLACK}$1${NORMAL}"
}

function echoWhite {
  echo "${WHITE}$1${NORMAL}"
}

# print

function printBold {
  echo -n "${BOLD}$1${NORMAL}"
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

function printBlack {
  echo -n "${BLACK}$1${NORMAL}"
}

function printWhite {
  echo -n "${WHITE}$1${NORMAL}"
}
