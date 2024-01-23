-- Base keymap file.
-- All plugin keymaps are in which-key configuration.
local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap.set("i", "<C-c>", "<esc>") -- easier close
keymap.set("n", "<C-h>", "^") -- jump to beginning of line
keymap.set("n", "<C-l>", "$") -- jump to end of line
keymap.set("n", "<C-j>", ")") -- jump to next block
keymap.set("n", "<C-k>", "(") -- jump to prev block
