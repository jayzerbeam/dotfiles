return {
	"glepnir/lspsaga.nvim",
	event = "LspAttach",
	config = function()
		require("lspsaga").setup({
			ui = {
				border = "rounded",
				code_action = "ﯧ",
			},
			move_in_saga = { prev = "<C-p>", next = "<C-n>" },
			finder_action_keys = {
				open = "<CR>",
			},
			definition_action_keys = {
				edit = "<CR>",
			},
		})
	end,
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		--Please make sure you install markdown and markdown_inline parser
		{ "nvim-treesitter/nvim-treesitter" },
	},
}
