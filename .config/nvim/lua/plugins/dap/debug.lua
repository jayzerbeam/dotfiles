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
		"mxsdev/nvim-dap-vscode-js",
		"microsoft/vscode-js-debug",
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
				"vscode-js-debug",
				"mxsdev/nvim-dap-vscode-js",
			},
		})
		-- see mason-nvim-dap README for more information
		require("nvim-dap-virtual-text").setup({})
		vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapCondition", { text = " ", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapLogPoint", { text = " ", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = " ", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "", linehl = "", numhl = "" })
		-- For more information, see |:help nvim-dap-ui|
		dapui.setup({
			controls = {
				icons = {
					disconnect = "",
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "",
					terminate = "",
				},
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		require("dap-vscode-js").setup({
			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
			debugger_path = (os.getenv("HOME")) .. ".local/share/nvim/mason/packages/js-debug-adapter",
		})
	end,
}
