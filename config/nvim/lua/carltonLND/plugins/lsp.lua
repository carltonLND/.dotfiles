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

      vim.cmd [[
        sign define DiagnosticSignInfo text=󰌶 texthl=DiagnosticSignInfo linehl= numhl=
        sign define DiagnosticSignHint text=󰌶 texthl=DiagnosticSignHint linehl= numhl=
      ]]

      local on_attach = function(_, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
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

      -- Go
      lspconfig["gopls"].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      -- Javascript, Typescript
      lspconfig["tsserver"].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      -- CSS
      lspconfig["cssls"].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      -- Python
      lspconfig["pyright"].setup {
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
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      rt.setup {
        server = {
          capabilities = capabilities,
          on_attach = function(_, bufnr)
            local bufopts = { buffer = bufnr, silent = true, noremap = true }
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
            vim.keymap.set(
              "n",
              "<leader>D",
              vim.lsp.buf.type_definition,
              bufopts
            )
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
            vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)

            -- Rust specific keymaps
            vim.keymap.set("n", "K", rt.hover_actions.hover_actions, bufopts)
          end,
          cmd = { "rustup", "run", "stable", "rust-analyzer" },
        },
      }
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      vim.o.foldcolumn = "0" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

      require("ufo").setup {
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      }

      vim.cmd [[hi UfoFoldedBg guibg=NONE]]
      vim.cmd [[hi Folded guibg=NONE]]
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
      "carltonLND/friendly-snippets", -- Use my fork to fix tsx html snippets
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip").filetype_extend("javascript", { "jsdoc" })
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
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next"
            or "<TAB>"
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
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      "L3MON4D3/LuaSnip",
      "windwp/nvim-autopairs",
    },
    config = function()
      local cmp = require "cmp"
      cmp.setup {
        completion = {
          completeopt = "menu,menuone,noselect",
        },
        preselect = cmp.PreselectMode.None,
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
            menu = {},
            maxwidth = 50,
            ellipses_char = "...",
            before = function(entry, vim_item)
              if entry.source.name == "nvim_lsp" then
                vim_item.dup = 0
              end
              return vim_item
            end,
          },
        },
        sources = cmp.config.sources({
          { name = "luasnip" },
          { name = "nvim_lsp" },
        }, {
          { name = "buffer" },
        }),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      }

      cmp.event:on(
        "confirm_done",
        require("nvim-autopairs.completion.cmp").on_confirm_done()
      )
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require "null-ls"

      local function has_eslintrc(utils)
        return utils.root_has_file_matches ".eslintrc.*"
      end

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      null_ls.setup {
        diagnostic_config = {
          virtual_text = false,
        },
        sources = {
          null_ls.builtins.diagnostics.eslint_d.with { condition = has_eslintrc },
          null_ls.builtins.code_actions.eslint_d.with {
            condition = has_eslintrc,
          },
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.isort.with {
            extra_args = { "--profile", "black" },
          },
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.rustfmt,
          null_ls.builtins.formatting.gofumpt,
        },
        on_attach = function(client, bufnr)
          if client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format {
                  bufnr = bufnr,
                  filter = function(client)
                    return client.name == "null-ls"
                  end,
                }
              end,
            })
          end
        end,
      }
    end,
  },
}
