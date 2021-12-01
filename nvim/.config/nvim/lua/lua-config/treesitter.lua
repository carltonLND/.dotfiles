local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
    ensure_installed = {"html", "css", "javascript", "python", "lua"},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

