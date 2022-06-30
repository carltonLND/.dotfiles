-- Setup nvim-tree
require("nvim-tree").setup {
  respect_buf_cwd = true,
  update_cwd = true,
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  view = {
    adaptive_size = true,
    width = 35,
    number = true,
    hide_root_folder = true,
    relativenumber = true,
    signcolumn = "no",
  },
  renderer = {
    add_trailing = true,
    indent_markers = {
      enable = true,
    },
  },
}

vim.cmd [[
  augroup nvim_tree_auto_close
    autocmd!
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
  augroup end
]]
