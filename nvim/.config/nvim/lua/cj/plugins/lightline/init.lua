local g = vim.g

-- Setup lightline
g.lightline = {
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
