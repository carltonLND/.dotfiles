-- Install packer if not found in ~/.config/nvim/ 
local install_path = vim.fn.stdpath("config").."/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

-- Start packer
return require("packer").startup(function ()
  -- Packer
  use "wbthomason/packer.nvim"

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
  }

  -- Lsp-config
  use {
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer"
  }

  -- Nvim-tree
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons"
    },
  }

  -- Vim fugitive
  use "tpope/vim-fugitive"

  -- Lightline
  use "itchyny/lightline.vim"

  -- Auto Pairs
  use "LunarWatcher/auto-pairs"

  -- Themes
  use "sainnhe/gruvbox-material"
      
  -- Sync Plugins On Install
  if packer_bootstrap then
    require("packer").sync()
  end
end)
