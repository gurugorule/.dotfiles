#!/bin/bash

#ERROR Fucntion 
error() { echo "ERROR $*"; exit 1; }
# check if superuser
if [ "$(id -u)" -eq 0 ]; then
# only for Debian/Ubuntu installing dependencies
  if [ -e /etc/os-release ]; then
    grep -q "ubuntu" /etc/os-release
    echo "apt pkg updating..."
    sleep 0.5
    apt update
  fi
else 
  error "This script requires superuser permissions. Please re-run as root."
  exit 1
fi

# function to check if command found. 
check_command() {
    if ! command -v "$1" >/dev/null 2>&1; then
      echo "$1 is not installed :) first install dependencies.. then re-run the script  Exiting."
      exit 1
    fi
}

# Check if tmux and neovim are installed
check_command tmux
check_command nvim
check_command kitty

rm -rf ~/.config/nvim/lua/custom 

cp -r ./custom ~/.config/nvim/lua/
cp -r ~/.dotfiles/.config/tmux ~/.config 
