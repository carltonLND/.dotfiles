-- Setup nvim-tree
require("nvim-tree").setup({
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  view = {
    width = 35,
    number = true,
    relativenumber = true,
  },
  renderer = {
    add_trailing = true,
    indent_markers = {
      enable = true,
    },
  },
})

vim.cmd([[
  augroup nvim_tree_auto_close
    autocmd!
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
  augroup end
]])
