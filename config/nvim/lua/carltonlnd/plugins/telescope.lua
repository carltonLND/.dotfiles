return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.2",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { "<leader>sf", "<CMD>Telescope find_files<CR>" },
    {
      "<leader>sF",
      function()
        require("telescope.builtin").find_files { hidden = true }
      end,
    },
    { "<leader>sg", "<CMD>Telescope live_grep<CR>" },
    { "<leader>ss", "<CMD>Telescope grep_string<CR>" },
    { "<leader>sb", "<CMD>Telescope buffers<CR>" },
    { "<leader>sh", "<CMD>Telescope help_tags<CR>" },
    {
      "<leader>s$",
      function()
        require("telescope.builtin").find_files { cwd = "~/.config/nvim" }
      end,
    },
  },
  config = true,
}
