return {
	"glepnir/lspsaga.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		--Please make sure you install markdown and markdown_inline parser
		{ "nvim-treesitter/nvim-treesitter" },
	},
	event = "LspAttach",
	config = function()
		require("lspsaga").setup({
			diagnostic = {
				max_height = 0.8,
				keys = {
					quit = { "q", "<ESC>" },
				},
			},
			ui = {
				border = "rounded",
				code_action = "",
			},
			lightbulb = {
				enable = true,
				virtual_text = false,
			},
			move_in_saga = { prev = "<C-p>", next = "<C-n>" },
			outline = {
				auto_preview = true,
				detail = true,
				auto_close = true,
				close_after_jump = true,
				layout = "float",
				max_height = 0.7,
				left_width = 0.4,
				keys = {
					jump = "<CR>",
					toggle_or_jump = "o",
					quit = "q",
				},
			},
			finder_action_keys = {
				open = "<CR>",
			},
			definition_action_keys = {
				edit = "<CR>",
			},
		})
	end,
}
