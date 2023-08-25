return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    local lspkind = require "lspkind"

    require("luasnip.loaders.from_vscode").lazy_load()

    vim.keymap.set("i", "<S-TAB>", function()
      return luasnip.jumpable(1) and "<Plug>luasnip-jump-next" or "<TAB>"
    end, { expr = true, silent = true })

    vim.keymap.set("s", "<S-TAB>", function()
      luasnip.jump(1)
    end)

    vim.keymap.set({ "i", "s" }, "<C-TAB>", function()
      luasnip.jump(-1)
    end)

    cmp.setup {
      completion = {
        completeopt = "menu,menuone,noselect",
      },
      preselect = cmp.PreselectMode.None,
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ["<TAB>"] = cmp.mapping.confirm { select = true },
        ["<C-s>"] = cmp.mapping {
          i = function()
            if cmp.visible() then
              cmp.abort()
            else
              cmp.complete {
                config = {
                  sources = {
                    { name = "nvim_lsp" },
                  },
                },
              }
            end
          end,
          c = function()
            if cmp.visible() then
              cmp.close()
            else
              cmp.complete {
                config = {
                  sources = {
                    { name = "nvim_lsp" },
                  },
                },
              }
            end
          end,
        },
      },
      sources = cmp.config.sources({
        { name = "luasnip" },
        {
          name = "nvim_lsp",
          entry_filter = function(entry)
            return require("cmp").lsp.CompletionItemKind.Snippet
              ~= entry:get_kind()
          end,
        },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
      formatting = {
        format = lspkind.cmp_format {
          mode = "symbol",
          menu = {},
          maxwidth = 50,
          ellipsis_char = "...",
          before = function(entry, vim_item)
            if entry.source.name == "nvim_lsp" then
              vim_item.dup = 0
            end
            return vim_item
          end,
        },
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    }
  end,
}
