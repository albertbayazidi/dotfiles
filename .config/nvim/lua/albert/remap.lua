--basic keymaps
vim.g.mapleader = " "

vim.keymap.set("n", "p", "P", { desc = "keeps previouse yank when pasting" })

vim.keymap.set("n", "q", "<Nop>", { desc = "Disable 'q' to prevent accidental macro recording" })

vim.keymap.set("n", "<leader>p", vim.cmd.Ex, { desc = "Open file explorer" })

vim.keymap.set("n", "cd", ":cd %", { desc = "Change the current directory" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlight on ecp" })

vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true })

-- complex keymaps
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })

vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })

vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })

vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "J", "gj", { desc = "Move down (works with long text)" })

vim.keymap.set("n", "K", "gk", { desc = "Move up (works with long text)" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "jump up, and center frame" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "jump down, and center frame" })

-- Visual mappings
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move marked marked text down" })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move marked marked text up" })

-- Custom telescope func
vim.keymap.set("n", "<leader>fd", function()
  local custom_picker = require("albert.dir_picker")
  custom_picker.find_directory_picker()
end, { desc = "Telescope folder picker" })
