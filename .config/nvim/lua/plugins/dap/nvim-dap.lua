return {
	"mfussenegger/nvim-dap",
	dependencies = {
		-- Creates a beautiful debugger UI
		"rcarriga/nvim-dap-ui",
		-- Installs the debug adapters for you
		{ "williamboman/mason.nvim", opts = {} },
		"jay-babu/mason-nvim-dap.nvim",
		"theHamsta/nvim-dap-virtual-text",
		-- Adapters
		"microsoft/debugpy",
		"microsoft/java-debug",
		"microsoft/vscode-js-debug",
		"mfussenegger/nvim-dap-python",
		"mxsdev/nvim-dap-vscode-js",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup({
			layouts = {
				{
					elements = {
						{
							id = "scopes",
							size = 0.25,
						},
						{
							id = "breakpoints",
							size = 0.25,
						},
						{
							id = "stacks",
							size = 0.25,
						},
						{
							id = "watches",
							size = 0.25,
						},
					},
					position = "left",
					size = 70,
				},
				{
					elements = {
						{
							id = "repl",
							size = 0.5,
						},
						{
							id = "console",
							size = 0.5,
						},
					},
					position = "bottom",
					size = 18,
				},
			},
		})
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open({ reset = true })
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		require("mason-nvim-dap").setup({
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_setup = true,
			handlers = {},
			ensure_installed = {
				-- js
				"mxsdev/nvim-dap-vscode-js",
				"microsoft/vscode-js-debug",
				-- python
				"microsoft/debugpy",
			},
		})

		-- see mason-nvim-dap README for more information
		require("nvim-dap-virtual-text").setup({})
		vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapCondition", { text = " ", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapLogPoint", { text = " ", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = " ", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "", linehl = "", numhl = "" })

		-- JavaScript Debugger Setup
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				-- With Mason, this will be in the path
				command = "js-debug-adapter",
				args = { "${port}" },
			},
		}
		local js_ft = { "typescript", "javascript", "typescriptreact" }
		for _, language in ipairs(js_ft) do
			dap.configurations[language] = {
				-- only if language is javascript, offer this debug action
				language == "javascript"
						and {
							type = "pwa-node",
							request = "launch",
							name = "Launch file in new Node process",
							program = "${file}",
							cwd = "${workspaceFolder}",
						}
					or nil,
				{
					type = "pwa-node",
					-- attach to an already running node process with --inspect flag
					-- default port: 9222
					request = "attach",
					processId = require("dap.utils").pick_process,
					name = "Attach debugger to existing `node --inspect` process",
					-- for compiled languages like TypeScript or Svelte.js
					sourceMaps = true,
					resolveSourceMapLocations = {
						"${workspaceFolder}/**",
						"!**/node_modules/**",
					},
					-- path to src in vite based projects (and most other projects as well)
					cwd = "${workspaceFolder}/src",
					-- we don't want to debug code inside node_modules, so skip it!
					skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
				},
			}
		end

		-- Python Setup
		require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
	end,
}
