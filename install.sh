#!/bin/bash

# list dependencies and current configs
dependencies=(stow git)
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
    else
      stow $pkg
    fi
  fi
done

# add fish to valid login shells
command -v fish | sudo tee -a /etc/shells

# use fish as default shell
echo "Changing default shell to fish..."
echo "User password is required..."
chsh -s $(which fish) $USER

# install fish plugin manager
echo "Installing fish plugins..."
fish << 'endblock' 
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
endblock

# install neovim plugins
echo "Installing neovim plugins..."
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync"

# finishing messages
echo "INSTALLATION COMPLETE"
echo "Language servers must be installed locally with npm: typescript typescript-language-server pyright"
echo "Formatting sources are: @fsouza/prettierd (npm), black (pip)"
echo "Finally please install a patched NERD font, currently using: 'FiraCode Nerd Font'."
