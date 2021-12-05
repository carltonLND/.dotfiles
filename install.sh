#!/bin/bash

# check if dependencies installed and on $PATH
dependencies=(stow git kitty fish nvim)
for element in "${dependencies[@]}";
do
    if ! command -v $element &> /dev/null; then
        echo "Error: Missing dependencies!"
        echo "Please ensure [ ${dependencies[@]} ] are installed and in your PATH"
        echo "Failed at: $element"
        exit
    fi
done

# stow packages
cd ~/.dotfiles
stow fish
stow nvim
stow git

# add fish to valid login shells
command -v fish | sudo tee -a /etc/shells

# use fish as default shell
chsh -s $(which fish) $USER

# install fish plugin manager
fish << 'endblock' 
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
endblock
