local cmd = vim.cmd
local opt = vim.opt
--local g = vim.g

-- Colorscheme
opt.termguicolors = true
opt.background = "dark"
cmd "colorscheme gruvbox-material"

-- Transparency
cmd "highlight Normal ctermbg=NONE guibg=NONE"
cmd "highlight NonText ctermbg=NONE guibg=NONE"
cmd "highlight LineNr ctermbg=NONE guibg=NONE"
cmd "highlight Folded ctermbg=NONE guibg=NONE"
cmd "highlight EndOfBuffer ctermbg=NONE guibg=NONE"
cmd "highlight CursorLineNr ctermbg=NONE guibg=NONE"
cmd "highlight SignColumn ctermbg=NONE guibg=NONE"

-- Sign Transparency
cmd "highlight RedSign ctermbg=NONE guibg=NONE"
cmd "highlight YellowSign ctermbg=NONE guibg=NONE"
cmd "highlight BlueSign ctermbg=NONE guibg=NONE"
cmd "highlight AquaSign ctermbg=NONE guibg=NONE"
cmd "highlight GreenSign ctermbg=NONE guibg=NONE"
cmd "highlight PurpleSign ctermbg=NONE guibg=NONE"
