-- LSP KEYMAP SETUP
local function lspsaga_maps()
  vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
  vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
  vim.keymap.set("n", "gr", "<cmd>Lspsaga rename ++project<CR>")
  vim.keymap.set("n","gd", "<cmd>Lspsaga goto_definition<CR>")
  vim.keymap.set("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")
  vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>")
  vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
  vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
  vim.keymap.set("n", "[D", function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end)
  vim.keymap.set("n", "]D", function()
    require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
  end)
  vim.keymap.set("n","<leader>o", "<cmd>Lspsaga outline<CR>")
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc ++quiet<CR>")
  vim.keymap.set({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
end

-- LSP SERVER SETUP
local function lua_lsp_setup()
  require("lspconfig").lua_ls.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }
        },
        telemetry = {
          enable = false,
        },
      }
    }
  }
end

local function lsp_config()
  local mason_lspconfig = require("mason-lspconfig")
  mason_lspconfig.setup()
  mason_lspconfig.setup_handlers({
    function (server_name)
      require("lspconfig")[server_name].setup {
        capabilities = require('cmp_nvim_lsp').default_capabilities()
      }
    end,
    ["lua_ls"] = lua_lsp_setup
  })
end

-- AUTO COMPLETION CONFIG
local function cmp_config()

  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert {
      ["<TAB>"] = cmp.mapping.confirm { select = true },
    },    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
      })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
      })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
        { name = 'cmdline' }
      })
  })
end

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig.ui.windows").default_options.border = "rounded"
    end,
    dependencies = {"glepnir/lspsaga.nvim", "williamboman/mason.nvim"}
  },
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    init = lspsaga_maps,
    config = true,
    dependencies = {"nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter"}
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({ ui = { border = "rounded" } })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = lsp_config,
    dependencies = {"williamboman/mason.nvim", "neovim/nvim-lspconfig",    "hrsh7th/nvim-cmp" }
  },
  {
    "hrsh7th/nvim-cmp",
    config = cmp_config,
    dependencies = {
      "neovim/nvim-lspconfig",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip"
    }
  },
}
