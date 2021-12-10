-- Setup nvim-cmp
local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      with_text = false,
    })
  },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },

  mapping = {
    ["<TAB>"] = cmp.mapping.confirm({ select = true })
  },

  sources = cmp.config.sources({
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" }
  }),

  experimental = {
    ghost_text = true
  }
}

cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" }
  }
})

-- Update native lsp with nvim-cmp capabilities
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

-- Define on_attach function for LSP servers
local function on_attach(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- LSP Keymaps
  local opts = { noremap = true, silent = true, }

  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  buf_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
end

-- Setup nvim-lsp-installer
require("nvim-lsp-installer").on_server_ready(function(server)
  local default_opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  -- Custom server options
  local server_opts = {
    ["sumneko_lua"] = function()
      default_opts.settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          },
        },
      }
    end,
  }

  local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
  server:setup(server_options)
end)
