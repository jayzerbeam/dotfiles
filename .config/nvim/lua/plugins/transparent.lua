return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	opts = {
		extra_groups = {
			"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
		},
		lualine_style = "default",
	},
	config = function()
		local transparent = require("transparent")
		transparent.clear_prefix("lualine")
		transparent.clear_prefix("Bufferline")
		transparent.clear_prefix("NeoTree")
	end,
}
