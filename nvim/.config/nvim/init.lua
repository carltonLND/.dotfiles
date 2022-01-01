-- Neovim Config
-- @ github.com/carltonlnd/.dotfiles

local NVIM_VERSION = "0.6"

-- Check current Neovim version
if vim.call("has", ("nvim-%s"):format(NVIM_VERSION)) ~= 1 then
  vim.api.nvim_notify(("Neovim version must be at least %s or above."):format(NVIM_VERSION), vim.log.levels.WARN, {})
  return
end

-- load plugin if installed for faster boot
pcall(require, "impatient")

-- install config from lua namespace
local status_ok, err = pcall(require, "cj")

if not status_ok then
  error(("Error loading namespace configuration...\n\n%s"):format(err))
end
