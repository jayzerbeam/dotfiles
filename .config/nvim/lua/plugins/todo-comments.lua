return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = true, -- show icons in the signs column
		keywords = {
			-- bug:
			ERR = {
				icon = " ",
				color = "error",
				alt = { "bug", "bugs", "error", "errors" },
			},
			-- done:
			DONE = {
				icon = " ",
				color = "done",
				alt = { "done" },
			},
			-- fix:
			FIX = {
				icon = " ",
				color = "fix",
				alt = { "fix" },
			},
			-- mark:
			MARK = { icon = " ", color = "mark", alt = { "mark" } },
			-- note:
			NOTE = { icon = " ", color = "note", alt = { "note", "notes" } },
			-- perf:
			PERF = { icon = " ", color = "perf", alt = { "perf" } },
			-- test:
			TEST = { icon = " ", color = "test", alt = { "test", "tests" } },
			-- todo:
			TODO = { icon = " ", color = "todo", alt = { "todo", "todos" } },
			-- warn:
			WARN = { icon = " ", color = "fix", alt = { "warn" } },
		},
		highlight = {
			multiline = false, -- enable multine todo comments
		},
		-- list of named colors where we try to extract the guifg from the
		-- list of highlight groups or use the hex color if hl not found as a fallback
		colors = {
			done = { "#A6E3A1" },
			error = { "#F38BA8" },
			fix = { "#F5C2E7" },
			mark = { "#B4BEFE" },
			note = { "#F9E2AF" },
			perf = { "#94E2D5" },
			test = { "#BAC2DE" },
			todo = { "#89B4FA" },
		},
	},
}
