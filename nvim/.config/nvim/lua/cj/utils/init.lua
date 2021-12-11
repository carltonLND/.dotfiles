local M = {}

-- Better keymapping function that ensures noremap
function M.map(mode, key, action, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, key, action, options)
end

-- Return correct leader key
function M.get_leader()
  if vim.g.mapleader == nil then
    return "SPACE"
  else
    return vim.g.mapleader
  end
end

return M
