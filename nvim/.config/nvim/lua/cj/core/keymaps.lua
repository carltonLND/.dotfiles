local map = require("cj.utils").map

-- Leader key
vim.cmd "let mapleader = ' '"

-- Normal Mode
map("n", "<leader>h", "<cmd>wincmd h<cr>")
map("n", "<leader>j", "<cmd>wincmd j<cr>")
map("n", "<leader>k", "<cmd>wincmd k<cr>")
map("n", "<leader>l", "<cmd>wincmd l<cr>")
map("n", "<leader><Tab>", "<cmd>bn<cr>")
map("n", "<leader><S-Tab>", "<cmd>bp<cr>")
map("n", "<leader>qq", "<cmd>bd<cr>")
map("n", "<leader>qQ", "<cmd>bd!<cr>")

-- Insert Mode
map("i", "<C-c>", "<Esc>")

-- Normal Mode Plugins
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>ft", "<cmd>NvimTreeToggle<cr>")
map("n", "<leader>ss", "<cmd>SessionSave<cr>")
map("n", "<leader>sl", "<cmd>SessionLoad<cr>")
