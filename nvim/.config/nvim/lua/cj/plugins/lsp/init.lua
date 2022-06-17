-- Setup nvim-cmp
local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      with_text = false,
    }),
  },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<TAB>"] = cmp.mapping.confirm({ select = true }),
  }),

  sources = cmp.config.sources({
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  }),

  experimental = {
    ghost_text = true,
  },
})

cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" },
  },
})

-- Update native lsp with nvim-cmp capabilities
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

-- Define on_attach function for LSP servers
local function on_attach(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- LSP Keymaps
  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  buf_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  buf_set_keymap("n", "<leader>dl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)

  -- Disable formatting (Using null-ls)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
  client.server_capabilities.documentOnTypeFormattingProvider = {}

  -- Disable virtual text when not ERROR severity
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      severity = vim.diagnostic.severity.ERROR,
    },
  })
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
            globals = { "vim" },
          },
        },
      }
    end,
    ["rust-analyzer"] = function()
      default_opts.settings = {
        assist = {
          importGranularity = "module",
          importPrefix = "self",
        },
        cargo = {
          loadOutDirsFromCheck = true,
        },
        procMacro = {
          enable = true,
        },
      }
    end,
  }

  local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
  server:setup(server_options)
end)

local diag_config = {
  -- virtual_text = false,
  update_in_insert = true,
}

vim.diagnostic.config(diag_config)

-- Setup null-ls formatting and code actions
local null_ls = require("null-ls")
local fmt_augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.xmllint,
    null_ls.builtins.formatting.stylua.with({
      extra_args = { "--config-path", vim.fn.expand("~/.config/stylua/stylua.toml") },
    }),
    null_ls.builtins.formatting.rustfmt.with({
      extra_args = { "--config-path", vim.fn.expand("~/.config/rustfmt/") },
    }),
    null_ls.builtins.code_actions.gitsigns,
  },

  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = fmt_augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = fmt_augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
