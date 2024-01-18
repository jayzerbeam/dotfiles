return {
	"ggandor/leap.nvim",
	config = function()
		local leap = require("leap")
		leap.opts.special_keys = {
			next_target = "n",
			prev_target = "p",
		}
	end,
}
