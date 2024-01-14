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
		"mxsdev/nvim-dap-vscode-js",
		"microsoft/vscode-js-debug",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

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
				"mxsdev/nvim-dap-vscode-js",
				"microsoft/vscode-js-debug",
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
	end,
}
