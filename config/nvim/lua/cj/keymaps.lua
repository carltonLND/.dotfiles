-- Set leader key
vim.g.mapleader = " "

local opts = { silent = true, noremap = true }

-- General keymaps
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("n", "<leader>bn", ":bn<CR>", opts)
vim.keymap.set("n", "<leader>bp", ":bp<CR>", opts)
vim.keymap.set("n", "<leader>=", "<C-a>", opts)
vim.keymap.set("n", "<leader>-", "<C-x>", opts)
vim.keymap.set("n", "<leader>wv", "<C-w>v", opts)
vim.keymap.set("n", "<leader>wh", "<C-w>s", opts)
vim.keymap.set("n", "<leader>we", "<C-w>=", opts)
vim.keymap.set("n", "<leader>wx", ":close<CR>", opts)
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts)
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts)
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("n", "<C-u>", '<C-u>zz', opts)
vim.keymap.set("n", "<C-d>", '<C-d>zz', opts)
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "p", '"_dP', opts)
vim.keymap.set("v", "<leader>y", '"+y', opts)
vim.keymap.set("n", "<leader>p", '"+p', opts)

-- Removed keymaps
vim.keymap.set("n", "s", "", opts)
vim.keymap.set("n", "q", "", opts)

-- TODO: Move to plugin spec
-- Plugin keymaps
-- vim.keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>", opts)
-- vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
