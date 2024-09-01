#!/bin/bash

#ERROR Fucntion 
error() { echo -e "\033[0;31m \rERROR \033[0m \n$*"; exit 1; }

# Function to show a spinner
show_spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep -w $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

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
    echo "Apt Package Repository is updating..."
    apt update > /dev/null 2>&1
    pid=$!
    show_spinner $pid
    echo "Update complete!"
  else 
    error "This script requires superuser permissions. \nPlease re-run as root."
    exit 1
  fi

}

# function to check if command found. 
check_command() {
    if ! command -v "$1" >/dev/null 2>&1; then
      error "$1 is not installed \n installing $1..."
      ./install_dependencies.sh 
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
