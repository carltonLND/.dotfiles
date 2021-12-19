local g = vim.g

-- Additional vim options
g.nvim_tree_quit_on_open = 1
g.nvim_tree_add_trailing = 1
g.nvim_tree_indent_markers = 1

-- Setup nvim-tree
require("nvim-tree").setup {
  auto_close = true,
  view = {
    width = 35,
    number = true,
    relativenumber = true,
  },
}
