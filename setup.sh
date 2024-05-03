#!/bin/bash


nvim_file_path = ~/.config/nvim
rm_chadrc_file = rm ~/.config/nvim/lua/custom/chadrc.lua

if [ -d $nvim_file_path]; then
  $rm_chadrc_file
else
  echo "NvChad not found, Installing NvChad..."
  git clone https://github.com/NvChad/starter ~/.config/nvim 
  $rm_chadrc_file

cp ./.config/nvim/chadrc.lua ~/.config/nvim/lua/custom/ 


cp ./.config/tmux ~/.config/ 

# install all nvim plugin 
nvim 

