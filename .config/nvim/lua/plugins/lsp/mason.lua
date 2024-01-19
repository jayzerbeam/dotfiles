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
				"clangd",
				"cssls",
				"html",
				"jsonls",
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
				-- "blackd-client", -- python formatter
				"csharpier", -- csharp formatter
				"prettierd", -- ts/js formatter
				"stylua", -- lua formatter
				"stylelint", -- css linter
				"eslint_d", -- ts/js linter
			},
			automatic_installation = true,
		})
	end,
}
