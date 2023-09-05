-- :let
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable providers as we're not using remote plugins
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0

-- :set
vim.opt.number = true -- Line numbers
vim.opt.tabstop = 2 -- 2 space tabs
vim.opt.expandtab = true -- Expand tab to use spaces
vim.opt.shiftwidth = 2 -- 2 spaces indent
vim.opt.shiftround = true -- Round indents to a multiple of shiftwidth
vim.opt.autoindent = true -- Continue indent from previous line
vim.opt.wrap = false -- Disable line wrapping
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Case sensitive when searching for caps
vim.opt.hlsearch = false -- Highlighting search is annoying
vim.opt.splitright = true -- New vertical split to the right
vim.opt.splitbelow = true -- New horizontal split to the bottom
vim.opt.laststatus = 3 -- Only show one status line for current window
vim.opt.showmode = false -- We have a statusline plugin
vim.opt.signcolumn = "yes" -- Always show column to stop shifting
vim.opt.undofile = true -- Save undo history across sessions
vim.opt.swapfile = false -- Disable swap file
vim.opt.pumheight = 6 -- Limit number of entried in popup menu
vim.opt.fillchars = { eob = " ", fold = " " } -- End of line characters e.g. no ~
vim.opt.foldmethod = "indent" -- Fold on indent
vim.opt.foldenable = false -- Disable folds at start
vim.opt.conceallevel = 3 -- Hide markdown formatting until on that line
vim.opt.background = "dark" -- Prefer dark colorschemes
vim.opt.termguicolors = true -- Enable extended color support
