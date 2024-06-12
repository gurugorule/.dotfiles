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
