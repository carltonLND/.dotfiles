local cmd = vim.cmd
local opt = vim.opt
local g = vim.g
local dir = vim.fn.stdpath('config')

-- General Settings
cmd "syntax on"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes:1"
opt.swapfile = false
opt.backup = false
opt.undodir = dir .. "/undodir/"
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
opt.clipboard:append("unnamedplus")
opt.completeopt = "menu,menuone,noselect"

-- Providers
g.loaded_python_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_node_provider = 0

-- Theme
opt.termguicolors = true
opt.background = "dark"

cmd [[
  try
    colorscheme gruvbox-material
    catch
  endtry
]]
