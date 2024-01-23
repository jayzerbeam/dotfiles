-- Options are automatically loaded before lazy.nvim startup

local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect,preview"
opt.confirm = true
-- opt.cursorcolumn = true
-- opt.cursorline = true
opt.expandtab = true
opt.formatoptions = "jcroqlnt"
opt.ignorecase = true
opt.number = true
opt.swapfile = false
opt.relativenumber = true
opt.scrolloff = 4
opt.shiftround = true
opt.shiftwidth = 4
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 4
opt.spelllang = { "en" }
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.tabstop = 4
opt.undofile = true
opt.undolevels = 10000
opt.wildmode = "longest:full,full"
opt.winminwidth = 5
opt.wrap = false
