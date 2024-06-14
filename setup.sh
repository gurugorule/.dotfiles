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

file_one=~/.dotfiles/.config/nvim/chadrc.lua
file_two=~/.config/nvim/lua/chadrc.lua

# Check if both files exist
if [ -e "$file_one" ] && [ -e "$file_two" ]; then
    # Copy the content of file 1 to file 2, overwriting file 2
    cp "$file_one" "$file_two"
    echo "Content copied and overwritten successfully."
else
    echo "One or both files do not exist."
fi

cp -r ~/.dotfiles/.config/tmux ~/.config 
