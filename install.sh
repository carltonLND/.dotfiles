# check if dependencies installed and on $PATH
dependencies=(stow git fish nvim)
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

# install neovim plugins
nvim --headless +PlugInstall +qall

# install fish plugins
chmod +x install-fish.sh
fish ./install-fish.sh

