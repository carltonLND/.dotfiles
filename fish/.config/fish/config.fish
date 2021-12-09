if status is-interactive
    # Commands to run in interactive sessions can go here
end

# exports
set -x EDITOR nvim
set -x DOT ~/.dotfiles
set -x FISHRC ~/.config/fish/config.fish
set -x VIMRC ~/.config/nvim/init.lua

# aliases
alias vi='nvim'
alias vim='nvim'
