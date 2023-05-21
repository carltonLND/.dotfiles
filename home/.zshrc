# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
plugins=(git tmux zsh-syntax-highlighting z)

# tmux plugin setup
ZSH_TMUX_DEFAULT_SESSION_NAME="Home"
source $ZSH/oh-my-zsh.sh

# User configuration
alias vi="nvim"
alias vim="nvim"
alias lg="lazygit"

# Set editor to Neovim (sudo -e $file)
export SUDO_EDITOR=nvim
export EDITOR=nvim

# Disable pagination where not needed
export GIT_PAGER=""
export AWS_PAGER=""

# Vi mode
bindkey -v
KEYTIMEOUT=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Enable atuin
eval "$(atuin init zsh --disable-up-arrow)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

