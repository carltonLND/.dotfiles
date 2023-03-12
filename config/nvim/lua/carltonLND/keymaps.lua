local opts = { silent = true, noremap = true }

-- General keymaps
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "<leader>y", '"+y', opts)
vim.keymap.set("n", "<leader>p", '"+p', opts)
vim.keymap.set("x", "p", "P", opts)
vim.keymap.set("x", "P", "p", opts)

-- Removed keymaps
vim.keymap.set("n", "s", "<nop>", opts)
vim.keymap.set("n", "q", "<nop>", opts)
vim.keymap.set("n", "Q", "<nop>", opts)
vim.keymap.set("v", "K", "<nop>", opts)

-- External keymaps
vim.keymap.set(
  "n",
  "<C-f>",
  "<cmd>silent !tmux neww tmux-sessionizer<CR>",
  opts
)
