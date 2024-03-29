return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "BurntSushi/ripgrep" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-treesitter/nvim-treesitter" },
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	opts = {
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	},
	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")
		telescope.setup({
			pickers = {
				find_files = {
					hidden = true,
					no_ignore = true,
				},
				live_grep = {
					additional_args = function()
						return { "--hidden", "--glob", "!**/.git/*" }
					end,
				},
				grep_string = {
					additional_args = function()
						return { "--hidden", "--glob", "!**/.git/*" }
					end,
				},
			},
			defaults = {
				file_ignore_patterns = {
					"build",
					"dist",
					"node_modules",
					"Logs",
					".git",
					".vscode",
					".npm",
					".tsbuildinfo",
					".stylelintcache",
					".jpeg",
					".jpg",
					".png",
					".pdf",
					-- fonts
					".ttf",
					".otf",
					-- unity
					"Library",
					".meta",
					".pdb",
					".asset",
					".dwlt",
					".unity",
					".settings",
					".lighting",
					".asmdef",
					".cginc",
					".bhc",
					".dll",
				},
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						height = 0.9,
						preview_width = 0.6,
						prompt_position = "top",
						width = 0.9,
					},
					vertical = {
						height = 0.9,
						mirror = true,
						preview_height = 0.6,
						prompt_position = "top",
						width = 0.9,
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
