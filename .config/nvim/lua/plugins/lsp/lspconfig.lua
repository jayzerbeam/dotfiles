return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{
			"hrsh7th/cmp-nvim-lsp",
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		local util = require("lspconfig.util")

		-- Gutter icons.
		for name, icon in pairs(signs) do
			name = "DiagnosticSign" .. name
			vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
		end

		-- Diagnostic config.
		vim.diagnostic.config({ virtual_text = true })
		vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

		-- LSP configs.
		lspconfig.clangd.setup({})
		-- Does not work in Unity!
		lspconfig.csharp_ls.setup({
			cmd = { "csharp-ls" },
			root_dir = util.root_pattern("*.sln", "*.csproj", "*.fsproj", ".git"),
			filetypes = { "cs" },
			init_options = {
				AutomaticWorkspaceInit = true,
			},
		})
		lspconfig.cssls.setup({})
		lspconfig["emmet_ls"].setup({
			filetypes = {
				"html",
				"typescriptreact",
				"javascript",
				"javascriptreact",
				"css",
				"sass",
				"scss",
				"less",
				"vue",
			},
		})
		lspconfig.html.setup({})
		lspconfig.jsonls.setup({})
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = {
							"vim",
							"require",
						},
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})
		lspconfig.pyright.setup({})
		lspconfig["stylelint_lsp"].setup({})
		lspconfig.tailwindcss.setup({
			settings = {
				tailwindCSS = {
					classAttributes = { "class", "className", "classList" },
					lint = {
						cssConflict = "warning",
						invalidApply = "error",
						invalidConfigPath = "error",
						invalidScreen = "error",
						invalidTailwindDirective = "error",
						invalidVariant = "error",
						recommendedVariantOrder = "warning",
					},
					validate = true,
				},
			},
		})
		lspconfig.tsserver.setup({})
		local function get_typescript_server_path(root_dir)
			local global_ts = "/home/jasonlong/n/lib/node_modules/typescript/lib"
			local found_ts = ""
			local function check_dir(path)
				found_ts = util.path.join(path, "node_modules", "typescript", "lib")
				if util.path.exists(found_ts) then
					return path
				end
			end
			if util.search_ancestors(root_dir, check_dir) then
				return found_ts
			else
				return global_ts
			end
		end
		lspconfig.volar.setup({
			on_new_config = function(new_config, new_root_dir)
				new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
			end,
		})
	end,
}
