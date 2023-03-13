# Get OS for Linux / Mac specifics
os=$(uname -s)

# x amount of <C-d> to exit
export IGNOREEOF=2

# Add .local scripts to PATH
export PATH=$HOME/.local/scripts/:$PATH

# Set editor to Neovim (sudo -e $file)
if [[ $os = "Linux" ]]; then
    export SUDO_EDITOR=/home/linuxbrew/.linuxbrew/bin/nvim
    export EDITOR=/home/linuxbrew/.linuxbrew/bin/nvim
    export VISUAL=/home/linuxbrew/.linuxbrew/bin/nvim
elif [[ $os = "Darwin" ]]; then
    export SUDO_EDITOR=/opt/homebrew/bin/nvim
    export EDITOR=/opt/homebrew/bin/nvim
    export VISUAL=/opt/homebrew/bin/nvim
fi

# Add Golang to PATH
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Add Rust env to PATH
. "$HOME/.cargo/env"

# Add Homebrew env to PATH
export HOMEBREW_NO_ENV_HINTS=1
if [[ $os = "Linux" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ $os = "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
