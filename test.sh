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
ping -c 1 8.8.8.8 &> /dev/null
# Check the exit status of the ping command
if [ $? -ne 0 ]; then
    error "No internet connection. \nPlease Connect to Internet"
    exit 1
fi
