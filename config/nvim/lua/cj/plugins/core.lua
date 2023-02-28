return {
	{ "lewis6991/impatient.nvim", priority = 999 },
	{
		"Pocco81/auto-save.nvim",
		config = true,
		opts = {
			execution_message = { message = "" },
			trigger_events = { "InsertLeave", "TextChanged" },
			condition = function(buf)
        -- Only autosave rust files for rust-analyzer
        if vim.bo.filetype ~= "rust" then
          return false
        end

				local fn = vim.fn
				local utils = require("auto-save.utils.data")

				if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
					return true
				end
				return false
			end,
		},
	},
}
