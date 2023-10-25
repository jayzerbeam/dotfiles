local keymap = vim.keymap -- for conciseness

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- other
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>") -- clear highlights
keymap.set("n", "<leader>+", "<C-a>") -- increment a number
keymap.set("n", "<leader>-", "<C-x>") -- decrement number
keymap.set("i", "<C-c>", "<esc>") -- easier close

-- windows
keymap.set("n", "<leader>sv", "<C-w>v") -- vertical window split
keymap.set("n", "<leader>sh", "<C-w>s") -- horizontal window split
keymap.set("n", "<leader>se", "<C-w>=") -- equalize window splits
keymap.set("n", "<leader>sq", "<cmd>close<CR>") -- close current window split
keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>") -- maximize window splits

-- tabs
keymap.set("n", "<leader>tc", "<cmd>tabnew<CR>") -- create new tab
keymap.set("n", "<leader>tq", "<cmd>tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tQ", "<cmd>tabonly<CR>") -- close all but current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>") -- previous tab
keymap.set("n", "<leader>tl", "<cmd>tabl<CR>") -- last tab
keymap.set("n", "<leader>tf", "<cmd>tabfir<CR>") -- first tab

-- diagnostics
keymap.set("n", "<leader>di", vim.diagnostic.open_float) -- show diagnostic

-- NeoTree
keymap.set("n", "<leader>fe", "<cmd>Neotree toggle<CR>")

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fr", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>ft", "<cmd>Telescope help_tags<CR>")
keymap.set("n", "<leader>fm", "<cmd>Telescope marks<CR>")

-- Todo
keymap.set("n", "<leader>do", "<cmd>TodoTrouble<CR>")

-- Trouble
keymap.set("n", "<leader>tr", "<cmd>TroubleToggle<CR>")
