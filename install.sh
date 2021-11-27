# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
    nixpkgs.fish \
    nixpkgs.git \
    nixpkgs.neovim \
    nixpkgs.bat \
    nixpkgs.stow

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

