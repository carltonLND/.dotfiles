local g = vim.g

-- Setup lightline
g.lightline = {
  active = {
    left = {
      { "mode", "past" },
      { "gitbranch", "filename", "modified" },
    },
  },
  component_function = {
    gitbranch = "fugitive#head",
  },
}
