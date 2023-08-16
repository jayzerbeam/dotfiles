local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup("plugins", {
	change_detection = {
		enabled = false,
		notify = true,
	},
	debug = false,
	git = {
		-- Kill processes that take more than X seconds
		timeout = 180,
	},
	install = {
		missing = true,
	},
	ui = {
		border = "rounded",
	},
})
