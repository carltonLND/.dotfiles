local prepare = require("utils").prepare

-- Setup treesitter
local treesitter = prepare("nvim-treesitter.configs")

if treesitter then
  treesitter.setup {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
end
