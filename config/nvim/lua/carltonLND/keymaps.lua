local opts = { silent = true, noremap = true }

-- General keymaps
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "p", '"_dP', opts)
vim.keymap.set("v", "<leader>y", '"+y', opts)
vim.keymap.set("n", "<leader>p", '"+p', opts)

-- Removed keymaps
vim.keymap.set("n", "s", "", opts)
vim.keymap.set("n", "q", "", opts)
vim.keymap.set("v", "K", "", opts)
