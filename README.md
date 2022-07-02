# .dotfiles

1. Change into home directory `cd`
2. Clone this repository `git clone https://github.com/carltonlnd/.dotfiles`
3. Change into new .dotfiles directory `cd ~/.dotfiles`
4. Make install.sh executable `chmod +x install.sh`
5. Run installation script `./install.sh`

## Errors

1. Install script hangs on installing neovim plugins

## Bugs

1. Install script does not check neovim version

## TODO

1. Decide on a neovim project manager plugin ( Some interactions are wierd ).
2. Perform better pre-installation checks ( Most notably prerequistes and their versions ).
3. Fix backups and stowing packages when directory already exists ( E.g. ~/.config/nvim/ ).
4. Update error handling for neovim config modules.
