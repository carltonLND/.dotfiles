-- Load cached files for faster startup
pcall(require, "impatient")

-- Load config modules
require("cj.keymaps")
require("cj.options")
require("cj.autocmds")

-- Bootstrap plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

-- Load plugins
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("cj.plugins", { ui = { border = "rounded" } })

-- TODO:
-- tmux
-- hide hint diagnostics
