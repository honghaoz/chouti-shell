#!/bin/bash

COLOR_RESET=$'\e[0m'

COLOR_BOLD=$'\e[1m'
COLOR_UNDERLINED=$'\e[4m'
COLOR_BLINK=$'\e[5m'
COLOR_REVERSE=$'\e[7m'

# Foreground Color
COLOR_BLACK=$'\e[30m'
COLOR_RED=$'\e[31m'
COLOR_GREEN=$'\e[32m'
COLOR_BROWN=$'\e[33m'
COLOR_BLUE=$'\e[34m'
COLOR_PURPLE=$'\e[35m'
COLOR_CYAN=$'\e[36m'
COLOR_LIGHTGRAY=$'\e[37m'
COLOR_YELLOW=$'\e[33m'

# Background Color
COLOR_BLACK_U=$'\e[40m'
COLOR_RED_U=$'\e[41m'
COLOR_GREEN_U=$'\e[42m'
COLOR_BROWN_U=$'\e[43m'
COLOR_BLUE_U=$'\e[44m'
COLOR_PURPLE_U=$'\e[45m'
COLOR_CYAN_U=$'\e[46m'
COLOR_LIGHTGRAY_U=$'\e[47m'

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
