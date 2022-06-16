-- Setup telescope
local telescope = require("telescope")
telescope.setup({
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    },
  },
})

-- Load extensions
telescope.load_extension("fzf")
telescope.load_extension("ui-select")
