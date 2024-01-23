-- This plugin remaps some convenient navigation mappings: C-J/K/H/L
return {
	"aserowy/tmux.nvim",
	config = function()
		require("tmux").setup()
	end,
}
