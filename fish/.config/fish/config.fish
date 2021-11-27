if status is-interactive
    # Commands to run in interactive sessions can go here
end

# path
fish_add_path ~/.nix-profile/bin

# exports
set -x EDITOR nvim
set -x FISHRC ~/.config/fish/config.fish
set -x VIMRC ~/.config/nvim/init.vim

# aliases
alias vi='nvim'
alias vim='nvim'

