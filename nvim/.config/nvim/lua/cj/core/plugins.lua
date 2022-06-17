local installed, packer_setup = pcall(require, "cj.packer")

if not installed then
  return false
end

local first_install = packer_setup.first_install
local packer = packer_setup.packer

vim.cmd([[
  augroup packer_config_cj
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return packer.startup(function(use)
  -- Required
  use("wbthomason/packer.nvim")
  use("lewis6991/impatient.nvim")

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("cj.plugins.treesitter")
    end,
  })

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
      },
    },
    config = function()
      require("cj.plugins.telescope")
    end,
    after = "telescope-fzf-native.nvim",
  })

  -- Nvim-tree
  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("cj.plugins.nvim-tree")
    end,
  })

  -- Lsp
  use({
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/nvim-lsp-installer",
      {
        "hrsh7th/nvim-cmp",
        requires = {
          "onsails/lspkind-nvim",
          "L3MON4D3/LuaSnip",
          "saadparwaiz1/cmp_luasnip",
          "hrsh7th/cmp-nvim-lua",
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          {
            "windwp/nvim-autopairs",
            config = function()
              require("cj.plugins.auto-pairs")
            end,
            after = "nvim-cmp",
          },
        },
      },
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("cj.plugins.lsp")
    end,
  })

  -- Floating terminal window
  use({
    "voldikss/vim-floaterm",
    config = function()
      require("cj.plugins.floaterm")
    end,
    cmd = { "FloatermNew", "FloatermToggle" },
  })

  -- Session manager
  use({
    "Shatur/neovim-session-manager",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("cj.plugins.session-manager")
    end,
  })

  -- Git signs
  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("gitsigns").setup()
    end,
  })

  -- Comment
  use({
    "numToStr/Comment.nvim",
    config = function()
      --require "cj.plugins.comment-nvim"
      require("Comment").setup()
    end,
  })

  -- Colorizer
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      vim.cmd("set termguicolors")
      require("colorizer").setup()
    end,
  })

  -- Lightline
  use({
    "itchyny/lightline.vim",
    requires = {
      { "kyazdani42/nvim-web-devicons" },
      { "itchyny/vim-gitbranch" },
    },
    config = function()
      require("cj.plugins.lightline")
    end,
  })

  -- TODO Only works after running PackerSync, not on startup
  -- Bufferline
  use({
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    requires = "kyazdani42/nvim-web-devicons",
    event = "VimEnter",
    config = function()
      require("cj.plugins.bufferline")
    end,
  })

  -- Quickscope
  use({
    "unblevable/quick-scope",
    config = function()
      require("cj.plugins.quick-scope")
    end,
  })

  -- Dashboard
  use({
    "glepnir/dashboard-nvim",
    config = function()
      require("cj.plugins.dashboard")
    end,
  })

  -- Theme
  use("folke/tokyonight.nvim")
  use("folke/lsp-colors.nvim")

  if first_install then
    packer.sync()
  end
end)
