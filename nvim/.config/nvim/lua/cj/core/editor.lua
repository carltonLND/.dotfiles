-- General Settings
local options = {
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,
  number = true,
  relativenumber = true,
  signcolumn = "yes:1",
  swapfile = false,
  backup = false,
  undodir = vim.fn.stdpath "config" .. "/undodir/",
  undofile = true,
  updatetime = 300,
  incsearch = true,
  hlsearch = false,
  ignorecase = true,
  smartcase = true,
  wrap = false,
  splitbelow = true,
  splitright = true,
  hidden = true,
  scrolloff = 12,
  sidescrolloff = 12,
  showmode = false,
  completeopt = "menu,menuone,noselect",
  termguicolors = true,
  clipboard = "unnamedplus",
  pumheight = 10,
  background = "dark",
  lazyredraw = true,
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

vim.cmd [[
  set formatoptions-=c formatoptions-=r formatoptions-=o
  set iskeyword+=-
]]

-- Providers
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
