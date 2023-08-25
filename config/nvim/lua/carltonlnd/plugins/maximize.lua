return {
  "declancm/maximize.nvim",
  keys = {
    {
      "<leader>m",
      function()
        require("maximize").toggle()
      end,
    },
  },
  opts = {
    default_keymaps = false,
  },
}
