-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.autoindent = true
opt.background = "dark"
opt.backspace = "indent,eol,start"
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect,preview"
opt.confirm = true
opt.cursorcolumn = true
opt.cursorline = true
opt.expandtab = true
opt.formatoptions = "jcroqlnt"
opt.ignorecase = true
opt.number = true
opt.swapfile = false
opt.relativenumber = true
opt.scrolloff = 999
opt.shiftround = true
opt.shiftwidth = 4
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false
opt.signcolumn = "yes"
opt.smartcase = true
opt.spelllang = { "en" }
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 500
opt.tabstop = 4
opt.undofile = true
opt.undolevels = 10000
opt.wildmode = "longest:full,full"
opt.winminwidth = 5
opt.wrap = false
