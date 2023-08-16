return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "BurntSushi/ripgrep" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-treesitter/nvim-treesitter" },
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
				},
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						height = 0.80,
						preview_width = 0.6,
						prompt_position = "top",
						width = 0.80,
					},
					vertical = {
						height = 0.8,
						mirror = true,
						preview_height = 0.6,
						prompt_position = "top",
						width = 0.8,
					},
				},
				mappings = {
					-- insert mode
					i = {
						["?"] = actions.which_key,
						["<C-p>"] = actions.move_selection_previous,
						["<C-n>"] = actions.move_selection_next,
						["<C-sh>"] = actions.select_horizontal,
						["<C-sv>"] = actions.select_vertical,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
					-- normal mode
					n = {},
				},
				sorting_strategy = "ascending",
			},
		})
		telescope.load_extension("fzf")
	end,
}
