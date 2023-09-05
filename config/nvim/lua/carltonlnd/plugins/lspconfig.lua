return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "pmizio/typescript-tools.nvim",
  },
  config = function()
    local lspconfig = require "lspconfig"
    require("lspconfig.ui.windows").default_options.border = "rounded"

    -- Diagnostics setup
    local signs =
      { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config {
      virtual_text = {
        severity = { min = vim.diagnostic.severity.ERROR },
        spacing = 4,
        prefix = "●",
      },
      update_on_insert = false,
      underline = false,
      signs = {
        severity = {
          vim.diagnostic.severity.WARN,
          vim.diagnostic.severity.INFO,
          vim.diagnostic.severity.HINT,
        },
      },
      severity_sort = true,
    }

    -- Keymaps
    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
    vim.keymap.set("n", "[D", function()
      vim.diagnostic.goto_prev {
        severity = { max = vim.diagnostic.severity.INFO },
      }
    end, opts)
    vim.keymap.set("n", "]D", function()
      vim.diagnostic.goto_next {
        severity = { max = vim.diagnostic.severity.INFO },
      }
    end, opts)
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.goto_prev {
        severity = { min = vim.diagnostic.severity.WARN },
        float = false,
      }
    end, opts)
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.goto_next {
        severity = { min = vim.diagnostic.severity.WARN },
        float = false,
      }
    end, opts)

    -- Server setup
    local lsp_defaults = lspconfig.util.default_config
    lsp_defaults.capabilities = vim.tbl_deep_extend(
      "force",
      lsp_defaults.capabilities,
      require("cmp_nvim_lsp").default_capabilities()
    )

    lspconfig["html"].setup {}

    lspconfig["cssls"].setup {}

    lspconfig["lua_ls"].setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.stdpath "config" .. "/lua"] = true,
            },
          },
        },
      },
    }

    -- External tools setup
    local mason_registry = require "mason-registry"
    local tsserver_path = mason_registry
      .get_package("typescript-language-server")
      :get_install_path()

    require("typescript-tools").setup {
      settings = {
        tsserver_path = tsserver_path
          .. "/node_modules/typescript/lib/tsserver.js",
      },
    }

    -- On attach autocommand
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local bufopts = { noremap = true, silent = true, buffer = ev.buf }

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
      end,
    })
  end,
}
