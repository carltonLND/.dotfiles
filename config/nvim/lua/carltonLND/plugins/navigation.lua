return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
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
    config = function()
      local telescope = require "telescope"
      telescope.setup {
        extensions = {
          file_browser = {
            theme = "ivy",
          },
        },
      }
      telescope.load_extension "file_browser"
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    keys = {
      {
        "<leader>sp",
        "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>",
      },
      { "<leader>sP", "<CMD>Telescope file_browser<CR>" },
    },
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
}
