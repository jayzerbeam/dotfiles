return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-tree/nvim-web-devicons", lazy = true }, -- not strictly required, but recommended
		{ "MunifTanjim/nui.nvim", lazy = true },
	},
	config = function()
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
		require("neo-tree").setup({
			close_if_last_window = true,
			enable_git_status = true,
			enable_diagnostics = true,
			popup_border_style = "rounded",
			source_selector = {
				statusline = true,
				winbar = true,
			},
			-- sources = {
			-- 	document_symbols = "",
			-- },
			default_component_configs = {
				icon = {
					folder_closed = "",
					folder_open = "",
					-- The next two settings are only a fallback, if you use
					-- nvim-web-devicons and configure default icons there then
					-- these will never be used.
					default = "*",
					highlight = "NeoTreeFileIcon",
				},
				modified = {
					symbol = "[+]",
					highlight = "NeoTreeModified",
				},
				name = {
					trailing_slash = false,
					use_git_status_colors = true,
					highlight = "NeoTreeFileName",
				},
			},
			window = {
				mappings = {
					["<C-c>"] = "close_window",
					["<C-sh>"] = "open_split",
					["<C-sv>"] = "open_vsplit",
					["<C-t>"] = "open_tabnew",
				},
				position = "float",
				-- settings that apply to float position only
				popup = {
					size = {
						height = "70%",
						width = "80%",
					},
				},
			},
		})
	end,
}
