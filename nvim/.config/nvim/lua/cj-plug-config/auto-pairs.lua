local prepare = require("utils").prepare

-- Setup nvim-autopairs
prepare("nvim-autopairs", {})

-- Setup autopairs for nvim-cmp
local cmp_autopairs = prepare('nvim-autopairs.completion.cmp')
local cmp = prepare('cmp')
if cmp and cmp_autopairs then
  cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
end
