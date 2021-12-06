return require("packer").startup(function ()
    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        },
    }

    -- Lightline
    use "itchyny/lightline.vim"

    -- Auto Pairs
    use "LunarWatcher/auto-pairs"

    -- Themes
    use "sainnhe/gruvbox-material"
end)
