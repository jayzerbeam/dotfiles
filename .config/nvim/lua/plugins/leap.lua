return {
	"ggandor/leap.nvim",
	config = function()
		local leap = require("leap")
		leap.create_default_mappings()
		leap.opts.special_keys = {
			next_target = "<c-n>",
			prev_target = "<c-p>",
		}
	end,
}
