-- Setup telescope
local telescope = require("telescope")
telescope.setup({
  defaults = {
    file_ignore_patterns = { ".git/" },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
    path_display = {
      truncate = 3,
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    },
  },
})

-- Load extensions
telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("notify")
telescope.load_extension("projects")
