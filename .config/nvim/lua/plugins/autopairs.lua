return {
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({
			check_ts = true, -- use treesitter to check for a pair.
			enable_check_bracket_line = false, -- Don't add pairs if it already has a close pair in the same line
			ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
			ts_config = {
				lua = { "string" }, -- it will not add pair on that treesitter node
				javascript = { "template_string" },
				java = false, -- don't check treesitter on java
			},
		})
	end,
}
