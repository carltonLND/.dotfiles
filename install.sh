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
stow fish
stow git
stow nvim

# add fish to valid login shells
command -v fish | sudo tee -a /etc/shells

# use fish as default shell
sudo chsh -s $(which fish) $USER

# install fish plugin manager
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# install fish plugins
fisher install pure-fish/pure

# install neovim plugins
nvim --headless +PlugInstall +qall

# finish message
echo ------------------------
echo "|Installation completed|"
echo ------------------------
