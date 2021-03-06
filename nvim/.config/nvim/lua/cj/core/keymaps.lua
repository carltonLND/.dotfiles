local map = require("cj.utils").map

-- Leader key
vim.g.mapleader = " "

-- Normal Mode
map("n", "<C-h>", "<cmd>wincmd h<cr>")
map("n", "<C-j>", "<cmd>wincmd j<cr>")
map("n", "<C-k>", "<cmd>wincmd k<cr>")
map("n", "<C-l>", "<cmd>wincmd l<cr>")
map("n", "<S-h>", "<cmd>bp<cr>")
map("n", "<S-l>", "<cmd>bn<cr>")
map("n", "<leader>qq", "<cmd>bd<cr>")
map("n", "<leader>qQ", "<cmd>bd!<cr>")
map("n", "<C-Up>", "<cmd>resize +2<cr>")
map("n", "<C-Down>", "<cmd>resize -2<cr>")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")
map("n", "q", "") -- I fat-finger q too much and don't use the feature currently
map("n", "Q", "") -- As above

-- Insert Mode
map("i", "<C-c>", "<Esc>")
map("i", "<M-Enter>", "<Esc>o")
map("i", "<C-Enter>", "<Esc>o")
map("i", "<M-Enter>", "<Esc>O")

-- Visual Mode
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "p", '"_dP')

-- Normal Mode Plugins
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
map("n", "<leader>tn", "<cmd>FloatermNew<cr>")
map("n", "<leader>tt", "<cmd>FloatermToggle<cr>")
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fp", "<cmd>Telescope projects theme=dropdown<cr>")
map("n", "<leader>fn", "<cmd>Telescope notify theme=dropdown<cr>")
map("n", "<leader>f.", "<cmd>Telescope find_files cwd=~/.config/nvim<cr>")
map("n", "<leader>sc", "<cmd>SessionManager! load_last_session<cr>")
map("n", "<leader>sl", "<cmd>SessionManager! load_session<cr>")
map("n", "<leader>sd", "<cmd>SessionManager! delete_session<cr>")
map("n", "<leader>Gd", "<cmd>Gitsigns diffthis<cr>")

-- Terminal Mode Plugins
map("t", "<Esc><Esc>", "<cmd>FloatermToggle!<cr>")
map("t", "<Esc>n", "<cmd>FloatermNew<cr>")
map("t", "<Esc>q", "<cmd>FloatermKill<cr>")
map("t", "<Esc>Q", "<cmd>FloatermKill!<cr>")
map("t", "<Esc>h", "<cmd>FloatermPrev<cr>")
map("t", "<Esc>l", "<cmd>FloatermNext<cr>")
map("t", "<Esc>k", "<Up>")
map("t", "<Esc>j", "<Down>")
