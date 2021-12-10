-- Neovim Config
-- @ github.com/carltonlnd/.dotfiles

-- Warn if impatient.nvim is not installed
pcall(require, "impatient")

-- install config from lua namespace
local status_ok, err = pcall(require, "cj")

if not status_ok then
  error(("Error loading namespace configuration...\n\n%s"):format(err))
end
