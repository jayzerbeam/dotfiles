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
		local signs = { Error = "", Warn = "", Hint = "󰌶", Info = "󰋽" }

		for name, icon in pairs(signs) do
			name = "DiagnosticSign" .. name
			vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
		end

		vim.diagnostic.config({ virtual_text = false })
		vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			require("cmp_nvim_lsp").default_capabilities(),
			opts.capabilities or {}
		)
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
		lspconfig.tsserver.setup({
			server = {
				capabilities = capabilities,
			},
		})
		lspconfig.clangd.setup({
			capabilities = capabilities,
		})
		lspconfig.csharp_ls.setup({
			capabilities = capabilities,
			init_options = {
				AutomaticWorkspaceInit = true,
			},
		})
		lspconfig.cssls.setup({
			capabilities = capabilities,
			filetypes = {
				"css",
				"scss",
			},
			settings = {
				css = {
					validate = true,
				},
				less = {
					validate = true,
				},
				scss = {
					validate = true,
				},
			},
		})
		lspconfig.html.setup({
			capabilities = capabilities,
			filetypes = { "html" },
			init_options = {
				configurationSection = { "html" },
				embeddedLanguages = {
					css = false,
					javascript = false,
				},
				provideFormatter = false,
			},
			settings = {},
		})
		lspconfig.jsonls.setup({
			capabilities = capabilities,
		})
		lspconfig["stylelint_lsp"].setup({
			capabilities = capabilities,
		})
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
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
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
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
	end,
}
