#!/bin/bash

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
