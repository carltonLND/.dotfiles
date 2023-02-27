local function telescope_maps()
	local builtin = require("telescope.builtin")
	local opts = { noremap = true, silent = true }

	vim.keymap.set("n", "<leader>sf", builtin.find_files, opts)
	vim.keymap.set("n", "<leader>sF", function()
		builtin.find_files({ hidden = true })
	end, opts)
	vim.keymap.set("n", "<leader>sg", builtin.live_grep, opts)
	vim.keymap.set("n", "<leader>ss", builtin.grep_string, opts)
	vim.keymap.set("n", "<leader>sb", builtin.buffers, opts)
	vim.keymap.set("n", "<leader>s$", function()
		builtin.find_files({ cwd = "~/.config/nvim" })
	end, opts)
end

local function telescope_config()
	local telescope = require("telescope")
	telescope.setup({
		defaults = { preview = false },
		pickers = {
			buffers = {
				cwd_only = true,
				mappings = {
					n = { ["<M-d>"] = require("telescope.actions").delete_buffer },
					i = { ["<M-d>"] = require("telescope.actions").delete_buffer },
				},
				theme = "dropdown",
			},
			find_files = { theme = "dropdown" },
		},
	})

	telescope.load_extension("fzf")
end

local function tmux_nav_config()
	local nvim_tmux_nav = require("nvim-tmux-navigation")

	nvim_tmux_nav.setup({
		disable_when_zoomed = true,
	})
end

local function tmux_nav_maps()
	vim.keymap.set("n", "<C-h>", require("nvim-tmux-navigation").NvimTmuxNavigateLeft)
	vim.keymap.set("n", "<C-j>", require("nvim-tmux-navigation").NvimTmuxNavigateDown)
	vim.keymap.set("n", "<C-k>", require("nvim-tmux-navigation").NvimTmuxNavigateUp)
	vim.keymap.set("n", "<C-l>", require("nvim-tmux-navigation").NvimTmuxNavigateRight)
end

local function nvim_tree_config()
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	require("nvim-tree").setup({
		sort_by = "case_sensitive",
		view = {
			hide_root_folder = true,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = true,
		},
	})
end

local function nvim_tree_maps()
	vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
end

return {
	{
		"nvim-telescope/telescope.nvim",

		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		init = telescope_maps,
		config = telescope_config,
	},
	{
		"alexghergh/nvim-tmux-navigation",
		init = tmux_nav_maps,
		config = tmux_nav_config,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		init = nvim_tree_maps,
		config = nvim_tree_config,
	},
}
