local prepare = require("utils").prepare

-- Setup treesitter
local config = {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

prepare("nvim-treesitter.configs", config)
