return require("packer").startup(function ()
    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim"
        },
    }

    -- Lightline
    use "itchyny/lightline.vim"



    -- Themes
	use "sainnhe/gruvbox-material"
end)
