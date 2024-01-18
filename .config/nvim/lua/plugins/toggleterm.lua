return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	version = "*",
	opts = {
		direction = "horizontal",
		float_opts = {
			border = "single",
		},
		open_mapping = "<C-t>",
		shade_terminals = false,
		size = function(term)
			if term.direction == "horizontal" then
				return vim.o.lines * 0.4
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.5
			end
		end,
	},
}
