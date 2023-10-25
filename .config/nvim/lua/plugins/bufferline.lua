return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				diagnostics = "nvim_lsp",
				mode = "tabs",
				separator_style = "slant", --"slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
				style_preset = bufferline.style_preset.default,
			},
		})
	end,
}
