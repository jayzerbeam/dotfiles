return {
	"ggandor/flit.nvim",
	config = function()
		local flit = require("flit")
		flit.setup({
			keys = { f = "f", F = "F", t = "t", T = "T" },
			labeled_modes = "v",
			multiline = true,
			opts = {
				special_keys = {
					next_target = "<c-n>",
					prev_target = "<c-p>",
				},
			},
		})
	end,
}
