-- Neovim Config
-- @ github.com/carltonlnd/.dotfiles

local NVIM_VERSION = "0.8"

-- TODO: THIS IS CURRENTLY NOT WORKING AS INTENDED
-- Check current Neovim version
if vim.call("has", ("nvim-%s"):format(NVIM_VERSION)) ~= 1 then
  vim.api.nvim_notify(("Neovim version must be at least %s or above."):format(NVIM_VERSION), vim.log.levels.WARN, {})
  if not next(vim.api.nvim_list_uis()) then
    vim.api.nvim_notify("Plugins not installed, please update neovim.", vim.log.levels.WARN, {})
    vim.cmd "quitall!"
  end
end

-- load plugin if installed for faster boot
pcall(require, "impatient")

-- install config from lua namespace
local status_ok, err = pcall(require, "cj")

if not status_ok then
  error(("Error loading namespace configuration...\n\n%s"):format(err))
end
