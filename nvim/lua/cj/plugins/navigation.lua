local function telescope_maps()
  local builtin = require('telescope.builtin')
  local opts = { noremap = true, silent = true }

  vim.keymap.set("n", "<leader>sf", builtin.find_files, opts)
  vim.keymap.set("n", "<leader>sF", function()
    builtin.find_files { hidden = true }
  end, opts)
  vim.keymap.set("n", "<leader>sg", builtin.live_grep, opts)
  vim.keymap.set("n", "<leader>ss", builtin.grep_string, opts)
  vim.keymap.set("n", "<leader>sb", builtin.buffers, opts)
  vim.keymap.set("n", "<leader>s$", function()
    builtin.find_files { cwd = "~/.config/nvim" }
  end, opts)
end

local function telescope_config()
  local telescope = require("telescope")
  telescope.setup({
    defaults = { preview = false },
    pickers = {
      buffers = {
        cwd_only = true,
        mappings = {
          n = { ["<M-d>"] = require("telescope.actions").delete_buffer, },
          i = { ["<M-d>"] = require("telescope.actions").delete_buffer, },
        },
        theme = "dropdown",
      },
      find_files = { theme = "dropdown" },
    },
  })

  telescope.load_extension("fzf")
end

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
    init = telescope_maps,
    config = telescope_config
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  }
}
