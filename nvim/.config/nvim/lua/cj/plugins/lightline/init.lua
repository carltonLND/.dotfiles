-- Setup lightline
local colorscheme = function()
  local status_ok, _ = pcall(vim.cmd, "colorscheme tokyonight")
  if not status_ok then
    return "deus"
  end

  return "tokyonight"
end

vim.g.lightline = {
  colorscheme = colorscheme(),
  active = {
    left = {
      { "mode", "paste" },
      { "gitbranch", "filename", "modified" },
    },
  },
  component_function = {
    gitbranch = "gitbranch#name",
  },
}

vim.cmd("highlight LightlineMiddle_command ctermbg=NONE guibg=NONE")
vim.cmd("highlight LightlineMiddle_normal ctermbg=NONE guibg=NONE")
vim.cmd("highlight LightlineMiddle_insert ctermbg=NONE guibg=NONE")
