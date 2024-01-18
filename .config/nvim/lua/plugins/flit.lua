return {
	"ggandor/flit.nvim",
	config = function()
		require("flit").setup({
			keys = { f = "f", F = "F", t = "t", T = "T" },
			-- A string like "nv", "nvo", "o", etc.
			labeled_modes = "v",
			multiline = true,
			-- Like `leap`s similar argument (call-specific overrides).
			-- E.g.: opts = { equivalence_classes = {} }
			opts = {
				special_keys = {
					next_target = "n",
					prev_target = "p",
				},
			},
		})
	end,
}
