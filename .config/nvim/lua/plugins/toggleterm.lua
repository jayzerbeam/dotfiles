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
			end
		end,
	},
}
