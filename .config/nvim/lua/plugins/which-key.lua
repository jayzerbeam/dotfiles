return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")
		vim.o.timeout = true
		vim.o.timeoutlen = 1000
		-- show the effects of a search / replace in a live preview window
		vim.o.inccommand = "split"
		require("which-key").setup({
			window = {
				border = "single", -- none, single, double, shadow
				position = "top", -- bottom, top
			},
			layout = {
				height = { min = 20, max = 50 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
			},
		})
		-- todo: Visual Mode Keymaps
		-- lvim.keys.visual_block_mode["<C-r>"] = [[<CMD>SearchReplaceSingleBufferVisualSelection<CR>]]
		-- lvim.keys.visual_block_mode["<C-s>"] = [[<CMD>SearchReplaceWithinVisualSelection<CR>]]
		-- lvim.keys.visual_block_mode["<C-b>"] = [[<CMD>SearchReplaceWithinVisualSelectionCWord<CR>]]
		wk.register({
			mode = "n",
			b = {
				name = "Buffers",
				c = { "<cmd>enew<CR>", "New Buffer" },
				f = { "<cmd>bfirst<CR>", "First Buffer" },
				l = { "<cmd>blast<CR>", "Last Buffer" },
				n = { "<cmd>bnext<CR>", "Next Buffer" },
				p = { "<cmd>bprev<CR>", "Previous Buffer" },
				q = { "<cmd>bdelete<CR>", "Delete Buffer" },
			},
			d = {
				name = "Trouble",
				o = { "<cmd>TodoTrouble<CR>", "To-Do List" },
				t = { "<cmd>TroubleToggle<CR>", "Trouble Toggle" },
			},
			f = {
				name = "Telescope",
				b = { "<cmd>Telescope buffers<CR>", "Find Buffers" },
				f = { "<cmd>Telescope find_files<CR>", "Find Files" },
				m = { "<cmd>Telescope marks<CR>", "Find Marks" },
				r = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
				s = { "<cmd>Telescope grep_string<CR>", "Grep String" },
				t = { "<cmd>Telescope help_tags<CR>", "Find Tags" },
			},
			h = {
				name = "Highlights",
				o = { "<cmd>nohl<CR>", "Clear Highlights" },
			},
			l = {
				name = "Lspsaga",
				c = { "<cmd>Lspsaga code_action<CR>", "Code Actions" },
				d = {
					name = "Diagnostics",
					n = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic" },
					p = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Previous Diagnostic" },
				},
				h = { "<cmd>Lspsaga hover_doc<CR>", "Hover Doc" },
				r = {
					name = "Rename and Replace",
					p = { "<cmd>Lspsaga project_replace<CR>", "Project Replace" },
					n = { "<cmd>Lspsaga rename<CR>", "Buffer Rename" },
				},
				g = {
					name = "Definitions",
					d = { "<cmd>Lspsaga goto_definition<CR>", "Go To Definition" },
					D = { "<cmd>Lspsaga goto_type_definition<CR>", "Go To Type Definition" },
					p = { "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },
					P = { "<cmd>Lspsaga peek_type_definition<CR>", "Peek Type Definition" },
				},
				o = { "<cmd>Lspsaga outline<CR>", "Outline" },
			},
			n = {
				name = "NeoTree",
				t = { "<cmd>Neotree toggle<CR>", "File Explorer" },
			},
			r = {
				name = "Search and Replace: Single Buffer", -- optional group name
				s = { "<CMD>SearchReplaceSingleBufferSelections<CR>", "[s]election list" },
				o = { "<CMD>SearchReplaceSingleBufferOpen<CR>", "[o]pen" },
				w = { "<CMD>SearchReplaceSingleBufferCWord<CR>", "[w]ord" },
				W = { "<CMD>SearchReplaceSingleBufferCWORD<CR>", "[W]ORD" },
				e = { "<CMD>SearchReplaceSingleBufferCExpr<CR>", "[e]xpr" },
				f = { "<CMD>SearchReplaceSingleBufferCFile<CR>", "[f]ile" },
				b = {
					name = "Search and Replace: Multi Buffer",
					s = {
						"<CMD>SearchReplaceMultiBufferSelections<CR>",
						"[s]election list",
					},
					o = { "<CMD>SearchReplaceMultiBufferOpen<CR>", "[o]pen" },
					w = { "<CMD>SearchReplaceMultiBufferCWord<CR>", "[w]ord" },
					W = { "<CMD>SearchReplaceMultiBufferCWORD<CR>", "[W]ORD" },
					e = { "<CMD>SearchReplaceMultiBufferCExpr<CR>", "[e]xpr" },
					f = { "<CMD>SearchReplaceMultiBufferCFile<CR>", "[f]ile" },
				},
			},
			s = {
				name = "Window Splits",
				q = { "<cmd>close<CR>", "Close Current Split" },
				e = { "<C-w>=", "Equalize Splits" },
				h = { "<C-w>s", "Horizontal Split" },
				m = { "<cmd>MaximizerToggle<CR>", "Maximize Splits" },
				v = { "<C-w>v", "Vertical Split" },
			},
			t = {
				name = "Tabs",
				Q = { "<cmd>tabonly<CR>", "Close All Other Tabs" },
				q = { "<cmd>tabclose<CR>", "Close Tab" },
				f = { "<cmd>tabfir<CR>", "First Tab" },
				l = { "<cmd>tabl<CR>", "Last Tab" },
				c = { "<cmd>tabnew<CR>", "New Tab" },
				n = { "<cmd>tabn<CR>", "Next Tab" },
				p = { "<cmd>tabp<CR>", "Previous Tab" },
			},
		}, { prefix = "<leader>" })
	end,
}
