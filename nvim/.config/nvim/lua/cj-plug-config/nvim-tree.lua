local prepare = require("utils").prepare
local g = vim.g

-- Require icon dependency
prepare("nvim-web-devicons", {})

-- Additional vim options
g.nvim_tree_quit_on_open = 1
g.nvim_tree_add_trailing = 1
g.nvim_tree_indent_markers = 1

-- Setup nvim-tree
local config = {
  auto_close = true,
  view = {
    width = 45,
    number = true,
    relativenumber = true,
  },
}

prepare("nvim-tree", config)
