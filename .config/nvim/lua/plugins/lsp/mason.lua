return {
	"williamboman/mason.nvim",
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim", module = "mason" },
		{ "jayp0521/mason-null-ls.nvim" },
	},
	init = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_null_ls = require("mason-null-ls")
		mason.setup({
			ui = {
				border = "rounded",
				height = 0.8,
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				width = 0.8,
			},
		})
		mason_lspconfig.setup({
			-- language servers
			ensure_installed = {
				"bashls",
				"clangd",
				"cssls",
				"csharp_ls",
				"html",
				"jsonls",
				"jdtls",
				"stylelint_lsp",
				"lua_ls",
				"pyright",
				"tailwindcss",
				"tsserver",
				"volar",
			},
			automatic_installation = true,
		})
		mason_null_ls.setup({
			-- linters/formatters
			ensure_installed = {
				"black", -- python formatter
				"csharpier", -- csharp formatter
				"gdtoolkit", -- gdscript
				"google-java-format", -- java
				"prettierd", -- ts/js formatter
				"shfmt", -- bash formatter
				"stylua", -- lua formatter
				"stylelint", -- css linter
			},
			automatic_installation = true,
		})
	end,
}
