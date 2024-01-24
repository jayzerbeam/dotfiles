return {
	"ggandor/leap.nvim",
	config = function()
		local leap = require("leap")
		leap.create_default_mappings()
		leap.opts.special_keys = {
			next_target = "n",
			prev_target = "N",
		}
	end,
}
