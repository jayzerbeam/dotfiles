vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for conciseness

-- no highlight
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- increment number
keymap.set("n", "<leader>+", "<C-a>")

-- decrement number
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("i", "<C-c>", "<esc>")

-- split window vertically
keymap.set("n", "<leader>sv", "<C-w>v")

-- split window horizontally
keymap.set("n", "<leader>sh", "<C-w>s")

-- make splits equal width
keymap.set("n", "<leader>se", "<C-w>=")

-- close current split window
keymap.set("n", "<leader>sx", ":close<CR>")

-- create new tab
keymap.set("n", "<leader>tc", ":tabnew<CR>")

-- close current tab
keymap.set("n", "<leader>tx", ":tabclose<CR>")

-- close all but current tab
keymap.set("n", "<leader>tX", ":tabonly<CR>")

-- go to next tab
keymap.set("n", "<leader>tn", ":tabn<CR>")

-- go to previous tab
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- go to last tab
keymap.set("n", "<leader>tl", ":tabl<CR>")

-- go to first tab
keymap.set("n", "<leader>tf", ":tabfir<CR>")

-- plugin keymaps
-- Maximize window splits
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- neotree
keymap.set("n", "<leader>fe", ":Neotree toggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fr", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")

-- diagnostics
keymap.set("n", "<leader>d", vim.diagnostic.open_float)
