-- Neovim Config
-- @ github.com/carltonlnd/.dotfiles

local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

function map(mode, key, cmd, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, key, cmd, options)
end

-- Load neovim configuration
require("cj-config")

-- Set neovim keymaps
cmd "let mapleader = ' '"

map("n", "<leader>h", "<cmd>wincmd h<cr>")
map("n", "<leader>j", "<cmd>wincmd j<cr>")
map("n", "<leader>k", "<cmd>wincmd k<cr>")
map("n", "<leader>l", "<cmd>wincmd l<cr>")

map("n", "<leader><Tab>", "<cmd>bn<cr>")
map("n", "<leader><S-Tab>", "<cmd>bp<cr>")

map("n", "<leader>qq", "<cmd>bd<cr>")
map("n", "<leader>qQ", "<cmd>bd!<cr>")

map("i", "<C-c>", "<Esc>")
map("i", "<M-Enter>", "<Esc>o")

-- Load plugin configuration
require("cj-plug-config")

-- Set plugin keymaps
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fF", "<cmd>Telescope file_browser<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")

map("n", "<leader>ft", "<cmd>NvimTreeToggle<cr>")































