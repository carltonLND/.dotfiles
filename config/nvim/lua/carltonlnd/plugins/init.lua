return {
  "christoomey/vim-tmux-navigator",
  "inkarkat/vim-ReplaceWithRegister",
  {
    "github/copilot.vim",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      vim.g.copilot_enabled = false
      vim.g.copilot_no_tab_map = true

      vim.api.nvim_set_keymap(
        "i",
        "<A-Enter>",
        'copilot#Accept("<CR>")',
        { silent = true, expr = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>cp",
        "<CMD>Copilot<CR>",
        { silent = true }
      )
    end,
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
