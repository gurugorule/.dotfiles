#!/bin/bash

#ERROR Fucntion 
error() { echo -e "ERROR \n$*"; exit 1; }

# Ping Google's public DNS server and Check if device is connected to Internet.
check_connection(){
  ping -c 1 8.8.8.8 &> /dev/null
  if [ $? -ne 0 ]; then
      error "No Internet Connection. \nPlease Connect to Internet"
      exit 1
  fi
}

# Update Apt Pkg Repo
update_pkg_repo(){
  if [ "$(id -u)" -eq 0 ]; then
    echo "apt pkg updating..."
    sleep 0.5
    apt update
  else 
    error "This script requires superuser permissions. \nPlease re-run as root."
    exit 1
  fi

}


# function to check if command found. 
check_command() {
    if ! command -v "$1" >/dev/null 2>&1; then
      error "$1 is not installed :) first install dependencies.. (\`run install_dependencies.sh\`) then re-run the script \nExiting."
      exit 1
    fi
}

check_connection

update_pkg_repo

check_command tmux
check_command nvim
check_command kitty

rm -rf ~/.config/nvim/lua/custom 

cp -r ./.config/nvim/custom ~/.config/nvim/lua/
cp -r ./.config/tmux ~/.config 
cp -r ./.config/kitty/kitty.conf ~/.config/kitty
