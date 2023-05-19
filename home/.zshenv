# Add cargo to PATH
. "$HOME/.cargo/env"

# Add Golang to PATH
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Add .local scripts to PATH
export PATH=$HOME/.local/scripts/:$PATH

# Add .local bin to PATH
export PATH=$HOME/.local/bin/:$PATH

# Add Homebrew env to PATH if on OS X
if [[ $(uname -s) = "Darwin" ]]; then
    export HOMEBREW_NO_ENV_HINTS=1
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
