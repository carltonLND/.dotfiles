if status is-interactive
    # Commands to run in interactive sessions can go here
end

# add homebrew to path for macos
if test -d /opt/homebrew
  eval (/opt/homebrew/bin/brew shellenv)
end

# exports
set -x EDITOR nvim
set -x DOT ~/.dotfiles
set -x PROJECTS ~/Projects
set -x FISHDIR ~/.config/fish/
set -x VIMDIR ~/.config/nvim/
set -x KITTYDIR ~/.config/kitty/

# aliases
alias vi='nvim'
alias vim='nvim'
