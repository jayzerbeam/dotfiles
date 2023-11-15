return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")
		local dap = require("dap")
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
				height = { min = 25, max = 50 }, -- min and max height of the columns
				width = { min = 25, max = 50 }, -- min and max width of the columns
			},
		})
		wk.register({
			mode = "n",
			d = {
				name = "DAP",
				["<F1>"] = {
					function()
						dap.step_into()
					end,
					"Step Into",
				},
				["<F2>"] = {
					function()
						dap.step_over()
					end,
					"Step Over",
				},
				["<F3>"] = {
					function()
						dap.step_out()
					end,
					"Step Out",
				},
				["<F4>"] = {
					function()
						dap.continue()
					end,
					"Continue",
				},
				b = {
					function()
						dap.toggle_breakpoint()
					end,
					"Toggle Breakpoint",
				},
				l = {
					":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
					"Log Point Message",
				},
				r = { ":lua require'dap'.repl.open()<CR>", "Open REPL" },
				B = {
					function()
						dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
					end,
					"Set Breakpoint Condition",
				},
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
			o = {
				name = "Trouble",
				o = { "<cmd>TodoTrouble<CR>", "To-Do List" },
				t = { "<cmd>TroubleToggle<CR>", "Trouble Toggle" },
			},
			-- todo: Visual Mode Keymaps
			-- lvim.keys.visual_block_mode["<C-r>"] = [[<CMD>SearchReplaceSingleBufferVisualSelection<CR>]]
			-- lvim.keys.visual_block_mode["<C-s>"] = [[<CMD>SearchReplaceWithinVisualSelection<CR>]]
			-- lvim.keys.visual_block_mode["<C-b>"] = [[<CMD>SearchReplaceWithinVisualSelectionCWord<CR>]]
			r = {
				name = "Search and Replace", -- optional group name
				s = { "<CMD>SearchReplaceSingleBufferSelections<CR>", "[s]election list" },
				o = { "<CMD>SearchReplaceSingleBufferOpen<CR>", "[o]pen" },
				w = { "<CMD>SearchReplaceSingleBufferCWord<CR>", "[w]ord" },
				W = { "<CMD>SearchReplaceSingleBufferCWORD<CR>", "[W]ORD" },
				e = { "<CMD>SearchReplaceSingleBufferCExpr<CR>", "[e]xpr" },
				f = { "<CMD>SearchReplaceSingleBufferCFile<CR>", "[f]ile" },
				b = {
					name = "Multiple Buffer Search",
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
			-- could group these together as "UI" or "Editor" or "View" or
			-- "Windows" etc.
			e = {
				name = "Editor",
				b = {
					name = "Buffers",
					c = { "<cmd>enew<CR>", "Create Buffer" },
					f = { "<cmd>bfirst<CR>", "First Buffer" },
					l = { "<cmd>blast<CR>", "Last Buffer" },
					n = { "<cmd>bnext<CR>", "Next Buffer" },
					p = { "<cmd>bprev<CR>", "Previous Buffer" },
					q = { "<cmd>bdelete<CR>", "Delete Buffer" },
				},
				h = {
					name = "Highlights",
					l = { "<cmd>nohl<CR>", "Clear Highlights" },
				},
				t = {
					name = "Tabs",
					c = { "<cmd>tabnew<CR>", "Create Tab" },
					f = { "<cmd>tabfir<CR>", "First Tab" },
					l = { "<cmd>tabl<CR>", "Last Tab" },
					n = { "<cmd>tabn<CR>", "Next Tab" },
					p = { "<cmd>tabp<CR>", "Previous Tab" },
					q = { "<cmd>tabclose<CR>", "Quit Tab" },
					Q = { "<cmd>tabonly<CR>", "Quit All Other Tabs" },
				},
				s = {
					name = "Splits",
					e = { "<C-w>=", "Equalize Splits" },
					h = { "<C-w>s", "Horizontal Split" },
					m = { "<cmd>MaximizerToggle<CR>", "Maximize Splits" },
					q = { "<cmd>close<CR>", "Quit Current Split" },
					v = { "<C-w>v", "Vertical Split" },
				},
			},
		}, { prefix = "<leader>" })
	end,
}
