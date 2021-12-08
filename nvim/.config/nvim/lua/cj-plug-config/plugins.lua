local prepare = require("utils").prepare

-- Install packer if not found
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Start packer
local packer = prepare("packer")
if packer then
  return packer.startup(function (use)
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
    if PACKER_BOOTSTRAP then
      packer.sync()
    end
  end)
end
