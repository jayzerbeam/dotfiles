return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				always_show_bufferline = true,
				style_preset = bufferline.style_preset.default,
			},
		})
	end,
}
