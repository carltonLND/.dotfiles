return {
  "stevearc/dressing.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    input = { enabled = false },
    select = {
      get_config = function(opts)
        if opts.kind == "codeaction" then
          return {
            telescope = require("telescope.themes").get_cursor(),
          }
        end
      end,
    },
  },
}
