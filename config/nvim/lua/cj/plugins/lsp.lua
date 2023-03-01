-- LSP KEYMAP SETUP
local function lspsaga_maps()
	vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
	vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
	vim.keymap.set("n", "gr", "<cmd>Lspsaga rename ++project<CR>")
	vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
	vim.keymap.set("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")
	vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga diagnostic_jump_next<CR>")
	vim.keymap.set("n", "<leader>d", function()
		require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
	end)
	vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc ++quiet<CR>")
	vim.keymap.set({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
end

-- LSP SERVER SETUP
local function lua_lsp_setup()
	require("lspconfig").lua_ls.setup({
		on_attach = lspsaga_maps,
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				telemetry = {
					enable = false,
				},
			},
		},
	})
end

local function lsp_config()
	local mason_lspconfig = require("mason-lspconfig")
	mason_lspconfig.setup()
	mason_lspconfig.setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup({
				on_attach = lspsaga_maps,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
		end,
		["lua_ls"] = lua_lsp_setup,
		["rust_analyzer"] = function()
			local rt = require("rust-tools")
			rt.setup({
				server = {
					on_attach = function(_, bufnr)
						lspsaga_maps()
						vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
					end,
				},
				tools = {
					hover_actions = {
						border = "rounded",
					},
				},
			})
		end,
	})
end

-- AUTO COMPLETION CONFIG
local function cmp_config()
	local cmp = require("cmp")

	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			["<TAB>"] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		}, {
			{ name = "buffer" },
		}),
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})

	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

-- FORMATTER CONFIG
local function formatter_config()
	local fmt = require("formatter.filetypes")
	require("formatter").setup({
		filetype = {
			lua = {
				fmt.lua.stylua,
			},
			python = {
				fmt.python.isort,
				fmt.python.black,
			},
			rust = {
				fmt.rust.rustfmt,
			},
			javascript = {
				fmt.javascript.prettierd,
			},
			html = {
				fmt.html.prettierd,
			},
			css = {
				fmt.css.prettierd,
			},
			json = {
				fmt.json.prettierd,
			},
			toml = {
				fmt.toml.taplo,
			},
			sh = {
				fmt.sh.shfmt,
			},
		},
	})
end

local function formatter_maps()
	vim.keymap.set("n", "<leader>f", ":FormatLock<CR>", { silent = true })
end

return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.diagnostic.config({
				virtual_text = false,
			})

			require("lspconfig.ui.windows").default_options.border = "rounded"
		end,
		dependencies = { "glepnir/lspsaga.nvim", "williamboman/mason.nvim" },
	},
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		init = lspsaga_maps,
		config = true,
		opts = {
			lightbulb = {
				enable = false,
			},
			ui = {
				border = "rounded",
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" },
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({ ui = { border = "rounded" } })
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = lsp_config,
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/nvim-cmp",
			"simrat39/rust-tools.nvim",
		},
	},
	{
		"simrat39/rust-tools.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = cmp_config,
		dependencies = {
			"neovim/nvim-lspconfig",
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"windwp/nvim-autopairs",
		},
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
		keys = {
			{
				"<s-tab>",
				function()
					return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
				end,
				expr = true,
				silent = true,
				mode = "i",
			},
			{
				"<s-tab>",
				function()
					require("luasnip").jump(1)
				end,
				mode = "s",
			},
			{
				"<c-tab>",
				function()
					require("luasnip").jump(-1)
				end,
				mode = { "i", "s" },
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = true,
	},
	{
		"mhartington/formatter.nvim",
		event = "BufRead",
		init = formatter_maps,
		config = formatter_config,
	},
}
