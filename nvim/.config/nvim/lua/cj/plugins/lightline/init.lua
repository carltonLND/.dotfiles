-- Setup lightline
vim.g.lightline = {
  colorscheme = "deus",
  active = {
    left = {
      { "mode", "paste" },
      { "gitbranch", "filename", "modified" },
    },
  },
  component_function = {
    gitbranch = "fugitive#head",
  },
}

vim.cmd "highlight LightlineMiddle_command ctermbg=NONE guibg=NONE"
vim.cmd "highlight LightlineMiddle_normal ctermbg=NONE guibg=NONE"
vim.cmd "highlight LightlineMiddle_insert ctermbg=NONE guibg=NONE"
