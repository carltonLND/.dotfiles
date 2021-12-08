local M = {}

function M.map(mode, key, action, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, key, action, options)
end

function M.prepare(target, opts)
	local status_ok, plugin = pcall(require, target)
	if not status_ok then
		return
	end

	if opts then
		plugin.setup(opts)
	else
		return plugin
	end
end

return M
