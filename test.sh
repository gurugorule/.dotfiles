# available() {
#     command -v "$1" >/dev/null 2>&1
# }
#
# SUDO=
# if [ "$(id -u)" -ne 0 ]; then
#     # Running as root, no need for sudo
#     if ! available sudo; then
#         error "This script requires superuser permissions. Please re-run as root."
#     elif available sudo; then
#         echo "superuser permissions"
#     fi
#
#     SUDO="sudo"
# fi
#!/bin/bash

# Check if the script is being run as superuser
# if [ "$(id -u)" -eq 0 ]; then
#     echo "You are the superuser."
# else
#     echo "You are not the superuser."
# fi
# this test file is fucked 
#

# install_tool(){
#   echo $1
#   sleep 5
#   echo $2 
# }  
#
# install_tool "kitty" "curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# && ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
# && cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# && cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# && sed -i 's|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g' ~/.local/share/applications/kitty*.desktop
# && sed -i 's|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g' ~/.local/share/applications/kitty*.desktop
# && echo 'kitty.desktop' > ~/.config/xdg-terminals.list "
#
# echo "hello"
# echo ""
# echo "guru"

# echo -e "Hello\ngurunath"
# a=tmux
error() { echo -e "ERROR \n$*"; exit 1; }
# error "$a is not installed :) first install dependencies.. (\`run install_dependencies.sh\`) then re-run the script \nExiting."

#!/bin/bash

# Ping Google's public DNS server
# ping -c 1 8.8.8.8 &> /dev/null
#
# # Check the exit status of the ping command
# if [ $? -ne 0 ]; then
#     echo "No internet connection."
# else
#     echo "Internet connection is available."
# fi
# ping -c 1 8.8.8.8 &> /dev/null
# # Check the exit status of the ping command
# if [ $? -ne 0 ]; then
#     error "No internet connection. \nPlease Connect to Internet"
#     exit 1
# fi

# update_pkg_repo(){
#   if [ "$(id -u)" -eq 0 ]; then
#     echo "apt pkg updating..."
#     apt update > /dev/null 2>&1
#
#   else 
#     error "This script requires superuser permissions. \nPlease re-run as root."
#     exit 1
#   fi
# }
#
# update_pkg_repo 

#!/bin/bash

# Function to show a spinner
# show_spinner() {
#     local pid=$1
#     local delay=0.1
#     local spinstr='|/-\'
#     while [ "$(ps a | awk '{print $1}' | grep -w $pid)" ]; do
#         local temp=${spinstr#?}
#         printf " [%c]  " "$spinstr"
#         local spinstr=$temp${spinstr%"$temp"}
#         sleep $delay
#         printf "\b\b\b\b\b\b"
#     done
#     printf "    \b\b\b\b"
# }
#
# # Print custom message
# echo "Program is updating..."
#
# # Update package repository and suppress the output
# sudo apt update > /dev/null 2>&1 &
#
# # Get the PID of the background process
# pid=$!
# show_spinner $pid
#
# echo "Update complete!"

#!/bin/bash

# Function to show a progress bar

show_progress() {
    local pid=$1
    local duration=$2
    local interval=1
    local progress=0

    while [ "$(ps -p $pid -o pid=)" ]; do
        sleep $interval
        progress=$((progress + interval))
        percentage=$((100 * progress / duration))
        if [ $percentage -gt 100 ]; then
            percentage=100
        fi

        printf "\r["
        for ((i=0; i<percentage; i+=2)); do
            printf "#"
        done
        for ((i=percentage; i<100; i+=2)); do
            printf " "
        done
        printf "] %d%%" "$percentage"
    done

    if [ $percentage -lt 100 ]; then
        percentage=100
        printf "\r["
        for ((i=0; i<percentage; i+=2)); do
            printf "#"
        done
        printf "] %d%%" "$percentage"
    fi
    printf "\n"
}
# Print custom message
echo "Program is updating..."

# Update package repository and suppress the output
sudo apt update > /dev/null 2>&1 &

# Get the PID of the background process
pid=$!

# Show progress bar for approximately 30 seconds
show_progress $pid 30

echo "Update complete!"

