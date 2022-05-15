-- Theme
local installed, _ = pcall(require, "tokyonight")
if not installed then
  vim.cmd("colorscheme slate")
  return
end

vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_comments = false
vim.g.tokyonight_italic_keywords = false

vim.cmd("colorscheme tokyonight")
