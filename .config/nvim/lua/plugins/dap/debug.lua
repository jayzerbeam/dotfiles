return {
	"mfussenegger/nvim-dap",
	dependencies = {
		-- Creates a beautiful debugger UI
		"rcarriga/nvim-dap-ui",
		-- Installs the debug adapters for you
		{ "williamboman/mason.nvim", opts = {} },
		"jay-babu/mason-nvim-dap.nvim",
		"theHamsta/nvim-dap-virtual-text",
		-- Useful status updates for LSP
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		-- { 'j-hui/fidget.nvim',       opts = {} },
		-- Add your own debuggers here
		"mxsdev/nvim-dap-vscode-js",
		"microsoft/vscode-js-debug",
		-- "firefox-devtools/vscode-firefox-debug",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_setup = true,
			handlers = {},
			ensure_installed = {
				-- 'netcoredbg',
				"vscode-js-debug",
				-- "bash-debug-adapter",
				-- "vscode-firefox-debug",
				"mxsdev/nvim-dap-vscode-js",
			},
		})

		-- You can provide additional configuration to the handlers,
		-- see mason-nvim-dap README for more information
		require("nvim-dap-virtual-text").setup({})
		-- Basic debugging keymaps, feel free to change to your liking!
		vim.keymap.set("n", "<F5>", dap.continue)
		vim.keymap.set("n", "<F1>", dap.step_into)
		vim.keymap.set("n", "<F2>", dap.step_over)
		vim.keymap.set("n", "<F3>", dap.step_out)
		vim.keymap.set(
			"n",
			"<leader>lp",
			":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>"
		)
		vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end)

		-- Dap UI setup
		-- For more information, see |:help nvim-dap-ui|
		dapui.setup({
			-- Set icons to characters that are more likely to work in every terminal.
			-- Feel free to remove or use ones that you like more! :)
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "↻",
					terminate = "□",
				},
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		-- DOTNET
		-- dap.adapters.coreclr = {
		--   type = 'executable',
		--   command = os.getenv('HOME') .. '/.local/share/nvim/mason/packages/netcoredbg/netcoredbg',
		--   args = { '--interpreter=vscode' }
		-- }
		--
		-- dap.configurations.cs = {
		--   {
		--     type = "coreclr",
		--     name = "launch - netcoredbg",
		--     request = "launch",
		--     program = function()
		--       return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
		--     end,
		--   },
		-- }
		--
		-- BASH
		-- dap.adapters.bashdb = {
		--   type = 'executable',
		--   command = os.getenv('HOME') .. '.local/share/nvim/mason/packages/bash-debug-adapter/bash-debug-adapter',
		--   name = 'bashdb',
		-- }
		-- dap.configurations.sh = {
		--   {
		--     type = 'bashdb',
		--     request = 'launch',
		--     name = "Launch file",
		--     showDebugOutput = true,
		--     pathBashdb = os.getenv('HOME') ..
		--         '.local/share/nvim/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb',
		--     pathBashdbLib = os.getenv('HOME') .. '.local/share/nvim/mason/packages/bash-debug-adapter/extension/bashdb_dir',
		--     trace = true,
		--     file = "${file}",
		--     program = "${file}",
		--     cwd = '${workspaceFolder}',
		--     pathCat = "cat",
		--     pathBash = "/bin/bash",
		--     pathMkfifo = "mkfifo",
		--     pathPkill = "pkill",
		--     args = {},
		--     env = {},
		--     terminalKind = "integrated",
		--   }
		-- }

		require("dap-vscode-js").setup({
			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
			debugger_path = (os.getenv("HOME")) .. ".local/share/nvim/mason/packages/js-debug-adapter",
		})
	end,
}
