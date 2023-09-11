# Add cargo to PATH
. "$HOME/.cargo/env"

# Add pnpm to PATH
export PNPM_HOME="/home/cj/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Add .local scripts to PATH
export PATH=$HOME/.local/scripts/:$PATH

# Add .local bin to PATH
export PATH=$HOME/.local/bin/:$PATH

# Add golang to PATH
export PATH=/usr/local/go/bin:$PATH

# Add Homebrew env to PATH if on OS X
if [[ $(uname -s) = "Darwin" ]]; then
    export HOMEBREW_NO_ENV_HINTS=1
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
