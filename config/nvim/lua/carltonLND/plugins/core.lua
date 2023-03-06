return {
  {
    "projekt0n/github-nvim-theme",
    version = "0.0.x",
    priority = 1000,
    config = function()
      require("github-theme").setup {
        comment_style = "NONE",
        keyword_style = "NONE",
      }
      vim.cmd [[colorscheme github_dark]]
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = { enable = true },
        indent = { enable = true, disable = { "python" } },
      }
    end,
  },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
      local ai = require "mini.ai"
      ai.setup {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = ai.gen_spec.treesitter(
            { a = "@function.outer", i = "@function.inner" },
            {}
          ),
          c = ai.gen_spec.treesitter(
            { a = "@class.outer", i = "@class.inner" },
            {}
          ),
        },
      }
    end,
  },
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup {
        popupmenu = { backend = "cmp" },
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = false,
          long_message_to_split = true,
          inc_rename = true,
          lsp_doc_border = true,
        },
        messages = {
          view_search = false,
        },
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = {
          minimum_width = -1,
          timeout = 2000,
          max_height = function()
            return math.floor(vim.o.lines * 0.75)
          end,
          max_width = function()
            return math.floor(vim.o.columns * 0.75)
          end,
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = true,
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "norcalli/nvim-colorizer.lua",
    keys = {
      { "<leader>C", "<CMD>ColorizerToggle<CR>" },
    },
    config = true,
  },
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    config = function()
      require("mini.comment").setup {
        hooks = {
          pre = function()
            require("ts_context_commentstring.internal").update_commentstring {}
          end,
        },
      }
    end,
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function()
      require("mini.pairs").setup {}
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },
  { "tpope/vim-sleuth", event = { "BufReadPost", "BufNewFile" } },
  {
    "declancm/maximize.nvim",
    keys = {
      {
        "<leader>m",
        function()
          require("maximize").toggle()
        end,
      },
    },
    opts = {
      default_keymaps = false,
    },
  },
  {
    "kwkarlwang/bufresize.nvim",
    event = "VeryLazy",
    config = true,
  },
}
