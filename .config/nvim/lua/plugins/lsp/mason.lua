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
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		mason_lspconfig.setup({
			ensure_installed = {
				"clangd",
				"cssls",
				"html",
				"jsonls",
				"stylelint_lsp",
				"lua_ls",
				"tailwindcss",
				"tsserver",
			},
			automatic_installation = true,
		})
		mason_null_ls.setup({
			ensure_installed = {
				"csharpier", -- csharp formatter
				"prettier", -- ts/js formatter
				"stylua", -- lua formatter
				"eslint_d", -- ts/js linter
			},
			automatic_installation = true,
		})
	end,
}
