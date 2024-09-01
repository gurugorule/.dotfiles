#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Function to install a tool if it doesn't exist
install_tool() {
    local tool_name=$1
    local install_command=$2

    if command_exists "$tool_name"; then
        echo "$tool_name is already installed."
    else
        echo "Installing $tool_name..."
        echo ""
        eval "$install_command"
    fi
}

# Install Neovim
install_tool "nvim" "&& wget -c https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
&& tar xvf nvim-linux64.tar.gz
&& sudo mv nvim-linux64 /usr/local/nvim
&& cd /usr/local/bin
&& sudo ln -svf ../nvim/bin/nvim nvim"

# Install Tmux
install_tool "tmux" "sudo apt update && sudo apt install -y tmux"

# Install Kitty
install_tool "kitty" "curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
&& ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
&& cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
&& cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
&& sed -i 's|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g' ~/.local/share/applications/kitty*.desktop
&& sed -i 's|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g' ~/.local/share/applications/kitty*.desktop
&& echo 'kitty.desktop' > ~/.config/xdg-terminals.list "

echo ""
echo "###########################"
echo "#  Installation complete  #"
echo "###########################"
