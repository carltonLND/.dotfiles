local cmd = vim.cmd
local opt = vim.opt
local g = vim.g
local HOME = os.getenv("HOME") -- Get path to $HOME

cmd "syntax on"

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes:1"
opt.swapfile = false
opt.backup = false
opt.undodir = HOME .. "/.config/nvim/undodir/"
opt.undofile = true
opt.incsearch = true
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
opt.wrap = false
opt.splitbelow = true
opt.splitright = true
opt.hidden = true
opt.scrolloff = 999
opt.showmode = false
opt.guicursor = ""
opt.clipboard:append("unnamedplus")
