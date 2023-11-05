-- Base keymap file.
-- All other keymaps are in which-key configuration.
local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap.set("i", "<C-c>", "<esc>") -- easier close
