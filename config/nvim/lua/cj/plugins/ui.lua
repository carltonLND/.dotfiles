local function treesitter_config()
  require("nvim-treesitter.configs").setup {
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
      --disable = { "python" },
    },
    autotag = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<c-s>",
        node_incremental = "<c-s>",
        scope_incremental = "<c-space>",
        node_decremental = "<c-backspace>",
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    },
  }
end

return {
  {
    "Mofiqul/dracula.nvim",
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme dracula]]
      vim.cmd [[highlight link CmpItemAbbr Normal]]
      vim.cmd [[highlight CmpItemAbbrMatch ctermbg=none guibg=none]]
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = true
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = treesitter_config
  }
}
