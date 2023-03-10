return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
    },
    init = function()
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<space>e", function()
        vim.diagnostic.open_float { border = "rounded" }
      end, opts)
      vim.keymap.set("n", "[D", function()
        vim.diagnostic.goto_prev {
          severity = { max = vim.diagnostic.severity.INFO },
          float = { border = "rounded" },
        }
      end, opts)
      vim.keymap.set("n", "]D", function()
        vim.diagnostic.goto_next {
          severity = { max = vim.diagnostic.severity.INFO },
          float = { border = "rounded" },
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
    end,
    config = function()
      require("lspconfig.ui.windows").default_options.border = "rounded"

      vim.diagnostic.config {
        virtual_text = {
          severity = { min = vim.diagnostic.severity.WARN },
          spacing = 4,
          prefix = "●",
        },
        update_on_insert = false,
        underline = false,
        signs = {
          severity = vim.diagnostic.severity.INFO,
        },
        severity_sort = true,
      }

      vim.cmd [[ sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl= ]]

      local on_attach = function(_, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
      end

      local lspconfig = require "lspconfig"
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- LUA
      lspconfig["lua_ls"].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              ignoreDir = { "undodir" },
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }

      lspconfig["gopls"].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      lspconfig["tsserver"].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local rt = require "rust-tools"
      rt.setup {
        server = {
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          on_attach = function(_, bufnr)
            local opts = { buffer = bufnr, silent = true, noremap = true }
            vim.keymap.set("n", "K", rt.hover_actions.hover_actions, opts)
            vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, opts)
          end,
          cmd = { "rustup", "run", "stable", "rust-analyzer" },
        },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = true,
    opts = {
      ui = { border = "rounded" },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = true,
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
        "<S-TAB>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<TAB>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "<S-TAB>",
        function()
          require("luasnip").jump(1)
        end,
        mode = "s",
      },
      {
        "<C-TAB>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = { "i", "s" },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require "cmp"
      cmp.setup {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<TAB>"] = cmp.mapping.confirm { select = true },
        },
        formatting = {
          format = require("lspkind").cmp_format {
            mode = "symbol",
            maxwidth = 50,
            ellipses_char = "...",
          },
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      }
    end,
  },
  {
    "mhartington/formatter.nvim",
    even = "VeryLazy",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local fmt = require "formatter.filetypes"

      local augroup = vim.api.nvim_create_augroup("UserFormatGroup", { clear = true })
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        command = "FormatWrite",
        group = augroup,
      })

      require("formatter").setup {
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
          go = {
            fmt.go.gofumpt,
          },
          javascript = {
            fmt.javascript.prettierd,
          },
          typescript = {
            fmt.typescript.prettierd,
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
      }
    end,
  },
}