return {
	"catppuccin/nvim",
	lazy = true,
	name = "catppuccin",
	init = function()
		require("catppuccin").setup({
			background = {
				dark = "mocha",
			},
			dim_inactive = {
				enabled = true,
				percentage = 0.75,
				shade = "dark",
			},
			flavour = "mocha",
			custom_highlights = function(colors)
				return {
					CursorColumn = { bg = "#2A2B3C" },
					CursorLine = { bg = "#2A2B3C" },
				}
			end,
			integrations = {
				cmp = true,
				dap = {
					enabled = true,
					enable_ui = true, -- enable nvim-dap-ui
				},
				gitsigns = true,
				indent_blankline = {
					enabled = true,
					colored_indent_levels = true,
					scope_color = "",
				},
				mason = true,
				neotree = {
					enabled = true,
					show_root = true,
					transparent_panel = false,
				},
				telescope = true,
				treesitter = true,
				which_key = true,
			},
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
			},
			term_colors = true,
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
