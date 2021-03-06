# if status is-interactive
    # Commands to run in interactive sessions can go here
# end

# add homebrew to path for macOS
if test -d /opt/homebrew
  eval (/opt/homebrew/bin/brew shellenv)
end

# shell variables
set -U EDITOR nvim
set -U DOT ~/.dotfiles
set -U PROJECTS ~/Projects
set -U FISHDIR ~/.config/fish/
set -U VIMDIR ~/.config/nvim/
set -U KITTYDIR ~/.config/kitty/
set -U nvm_default_version latest

# aliases
alias vi='nvim'
alias vim='nvim'
alias activate='source env/bin/activate.fish'
alias py='python3'

# add alias to windows home directory if using wsl
if test -d /mnt/c/Users/CJ
  alias cj='cd /mnt/c/Users/CJ'
end

# tokyonight colorscheme
set -l foreground c0caf5
set -l selection 33467C
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7
    
# syntax highlighting
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment
    
# completion colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
