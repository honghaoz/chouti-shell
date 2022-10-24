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

function echo_bold {
  echo "${BOLD}$1${NORMAL}"
}

function echo_red {
  echo "${RED}$1${NORMAL}"
}

function echo_green {
  echo "${GREEN}$1${NORMAL}"
}

function echo_yellow {
  echo "${YELLOW}$1${NORMAL}"
}

function echo_blue {
  echo "${BLUE}$1${NORMAL}"
}

function echo_magenta {
  echo "${MEGENTA}$1${NORMAL}"
}

function echo_cyan {
  echo "${CYAN}$1${NORMAL}"
}

function echo_black {
  echo "${BLACK}$1${NORMAL}"
}

function echo_white {
  echo "${WHITE}$1${NORMAL}"
}

# print

function print_bold {
  echo -n "${BOLD}$1${NORMAL}"
}

function print_red {
  echo -n "${RED}$1${NORMAL}"
}

function print_green {
  echo -n "${GREEN}$1${NORMAL}"
}

function print_yellow {
  echo -n "${YELLOW}$1${NORMAL}"
}

function print_blue {
  echo -n "${BLUE}$1${NORMAL}"
}

function print_magenta {
  echo -n "${MEGENTA}$1${NORMAL}"
}

function print_cyan {
  echo -n "${CYAN}$1${NORMAL}"
}

function print_black {
  echo -n "${BLACK}$1${NORMAL}"
}

function print_white {
  echo -n "${WHITE}$1${NORMAL}"
}
