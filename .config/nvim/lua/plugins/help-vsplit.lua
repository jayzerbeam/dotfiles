return {
	"anuvyklack/help-vsplit.nvim",
	config = function()
		local help_vsplit = require("help-vsplit")
		help_vsplit.setup({
			always = true,
			buftype = { "help" },
			filetype = { "man" },
			side = "right",
		})
	end,
}
