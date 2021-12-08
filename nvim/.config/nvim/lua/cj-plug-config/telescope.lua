local prepare = require("utils").prepare

-- Setup telescope
local telescope = prepare("telescope")
if telescope then
  telescope.setup {}

  -- Load extensions
  telescope.load_extension("fzf")
end

