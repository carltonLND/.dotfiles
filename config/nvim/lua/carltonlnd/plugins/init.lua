return {
  "christoomey/vim-tmux-navigator",
  "inkarkat/vim-ReplaceWithRegister",
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  { "tpope/vim-sleuth", event = { "BufReadPost", "BufNewFile" } },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },
  {
    "norcalli/nvim-colorizer.lua",
    keys = {
      { "<leader>C", "<CMD>ColorizerToggle<CR>" },
    },
    config = true,
  },
}
