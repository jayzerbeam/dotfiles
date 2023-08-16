-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	init = function()
-- 		require("tokyonight").setup({})
-- 		vim.cmd.colorscheme("tokyonight-night")
-- 	end,
-- }
--
return {
	"catppuccin/nvim",
	lazy = true,
	name = "catppuccin",
	init = function()
		require("catppuccin").setup({
			background = {
				dark = "mocha",
			},
			-- color_overrides = {
			-- 	mocha = {
			-- 		base = "#181825",
			-- 	},
			-- },
			dim_inactive = {
				enabled = true,
				shade = "dark",
				percentage = 0.25,
			},
			flavour = "mocha",
			integrations = {
				cmp = true,
				dap = {
					enabled = true,
					enable_ui = true, -- enable nvim-dap-ui
				},
				gitsigns = true,
				indent_blankline = {
					enabled = true,
					colored_indent_levels = false,
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
