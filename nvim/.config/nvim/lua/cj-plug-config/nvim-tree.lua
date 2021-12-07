local cmd = vim.cmd
local g = vim.g

-- Require icon dependency
require("nvim-web-devicons").setup {}

-- Additional vim options
g.nvim_tree_quit_on_open = 1
g.nvim_tree_add_trailing = 1
g.nvim_tree_indent_markers = 1

-- Setup nvim-tree
local nvim_tree = require("nvim-tree")

nvim_tree.setup {
  auto_close = true,
  view = {
    width = 45,
  },
}

