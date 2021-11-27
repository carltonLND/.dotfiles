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

# move to new fish shell
fish

# add nix to fish path
fish_add_path ~/.nix-profile/bin

# install fish plugin manager
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# install fish plugins
fisher install pure-fish/pure
