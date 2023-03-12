# x amount of <C-d> to exit
export IGNOREEOF=2

# Add .local/bin to PATH
export PATH=$HOME/.local/scripts/:$PATH

# Set editor to Neovim
export SUDO_EDITOR=/home/linuxbrew/.linuxbrew/bin/nvim
export EDITOR=/home/linuxbrew/.linuxbrew/bin/nvim
export VISUAL=/home/linuxbrew/.linuxbrew/bin/nvim

# Add Golang to PATH
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Add Rust env to PATH
. "$HOME/.cargo/env"

# Add Homebrew env to PATH
export HOMEBREW_NO_ENV_HINTS=1
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
