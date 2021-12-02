# check that gnu stow is installed and on PATH
if ! command -v stow &> /dev/null
then
    echo "stow could not be found"
    exit
fi

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

