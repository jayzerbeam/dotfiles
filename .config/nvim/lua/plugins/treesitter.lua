return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				"bash",
				"css",
				"dockerfile",
				"graphql",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"python",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
			auto_install = false,
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-n>",
					node_incremental = "<C-n>",
					scope_incremental = "<C-s>",
					node_decremental = "<C-p>",
				},
			},
		})
	end,
}
