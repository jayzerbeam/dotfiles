-- return {}
return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = {
			char = { "│", "|", "¦", "┆", "┊" },
		},
	},
	config = function(_, opts)
		require("ibl").setup(opts)
	end,
}
