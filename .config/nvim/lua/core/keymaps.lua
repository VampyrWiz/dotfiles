-- Keymaps for better default experience

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- save file
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", opts)
vim.keymap.set("i", "<C-s>", "<C-o>:w<CR>", opts)
vim.keymap.set("v", "<C-s>", "<cmd>w<CR>", opts)

-- save file without auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- quit current window
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", opts)

-- quit all windows (quit Neovim)
vim.keymap.set("n", "<leader>qa", "<cmd>qa<CR>", opts)

-- Copy to system clipboard with Ctrl-C in Normal and Visual mode
vim.keymap.set({ "n", "v", "i" }, "<C-c>", '"+y', opts)

-- Paste from system clipboard with Ctrl-V in Normal mode
vim.keymap.set({ "n", "v" }, "<C-v>", '"+p', opts)

-- Paste from system clipboard with Ctrl-V in Insert mode (paste after cursor)
vim.keymap.set("i", "<C-v>", "<C-r>+", opts)

-- Normal mode: Select all
vim.keymap.set("n", "<C-a>", "ggVG", opts)

-- Visual mode: Reselect all
vim.keymap.set("v", "<C-a>", "<Esc>ggVG", opts)

-- Insert mode: Exit insert, select all, re-enter insert at the end
vim.keymap.set("i", "<C-a>", "<Esc>ggVG", opts)

-- In visual mode, pressing Backspace deletes the whole selection (if all is selected)
vim.keymap.set("v", "<BS>", '"_d', opts)

-- Open terminal in a horizontal split below with <leader>h
vim.keymap.set("n", "<leader>h", "<cmd>belowright split | terminal<CR>", opts)

-- Ctrl-Z for undo (already default in Normal mode, but added explicitly)
vim.keymap.set("n", "<C-z>", "u", opts)
vim.keymap.set("i", "<C-z>", "<C-o>u", opts)
vim.keymap.set("v", "<C-z>", "u", opts)

-- Ctrl-Y for redo (Ctrl-R is default, but we remap for convenience)
vim.keymap.set("n", "<C-y>", "<C-r>", opts)
vim.keymap.set("i", "<C-y>", "<C-o><C-r>", opts)
vim.keymap.set("v", "<C-y>", "<C-r>", opts)
