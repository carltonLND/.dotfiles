#!/bin/bash

# list dependencies and current configs
dependencies=(stow git fish nvim)
configs=(kitty fish nvim)

# check if dependencies installed and on $PATH
for element in "${dependencies[@]}"; do
  if ! command -v $element &> /dev/null; then
    echo "Error: Missing dependencies!"
    echo "Please ensure [ ${dependencies[@]} ] are installed and in your PATH"
    echo "Failed at: $element"
    exit
  fi
done

# backup old configuration directories
cd ~/.config
echo "Backing up previous folders in ~/.config..."
for config in "${configs[@]}"; do
  if -d "$config"; then
    mv -v "$config" "{dir}-backup"
  fi
done

# stow packages
cd ~/.dotfiles
echo "Stowing packages..."
for pkg in *; do
  if [[ -d $pkg ]]; then
    if [[ $pkg == "git" ]]; then
      echo "WARNING: Attempting to install carltonLND's git config..."
      read -r -p "Skipping personal git dotfiles. Override? [y/N] " response
      response=${response,,}
      if [[ "$response" =~ ^(yes|y)$ ]]; then
        stow $pkg
      fi
    elif [[ $pkg != "fish" ]]; then
      stow $pkg
    fi
  fi
done

# add fish to valid login shells
echo "Setting up fish as default shell..."
echo "Password for $USER may be required"
if ! grep -q "/usr/bin/fish" "/etc/shells"; then
  command -v fish | sudo tee -a /etc/shells
fi

# use fish as default shell
echo "Changing default shell to fish..."
chsh -s $(which fish) $USER

# install fish plugin manager
echo "Installing fish plugins..."
fish << "EOF"
  curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
EOF
rm ~/.config/fish/fish_plugins
stow fish
fish << "EOF"
  fisher update
EOF

# install neovim plugins
nvim --headless -c "quitall"
echo "Installing neovim plugins..."
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync"
echo "Installing maintained treesitter parsers (This might take a while)..."
nvim --headless -es -c "TSInstallSync maintained" -c "quitall" 

# finishing messages
echo "----------------------------------------------------------------------------------"
echo "INSTALLATION COMPLETE"
echo "Finally please install a patched NERD font, currently using: 'FiraCode Nerd Font'."
