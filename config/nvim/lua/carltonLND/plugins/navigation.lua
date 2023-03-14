return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "stevearc/dressing.nvim" },
    version = false,
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
  },
  {
    "alexghergh/nvim-tmux-navigation",
    keys = {
      {
        "<C-h>",
        function()
          require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
        end,
      },
      {
        "<C-j>",
        function()
          require("nvim-tmux-navigation").NvimTmuxNavigateDown()
        end,
      },
      {
        "<C-k>",
        function()
          require("nvim-tmux-navigation").NvimTmuxNavigateUp()
        end,
      },
      {
        "<C-l>",
        function()
          require("nvim-tmux-navigation").NvimTmuxNavigateRight()
        end,
      },
    },
    opts = {
      disable_when_zoomed = true,
    },
  },
  {
    "mbbill/undotree",
    keys = {
      { "<leader>su", "<CMD>UndotreeToggle<CR>" },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader>sp", "<CMD>NvimTreeToggle<CR>" },
    },
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup()
    end,
  },
}
