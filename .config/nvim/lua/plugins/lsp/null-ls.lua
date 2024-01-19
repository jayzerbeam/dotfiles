local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
	-- Note that null-ls is archived, but the API is the same.
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")
		local diagnostics = null_ls.builtins.diagnostics
		local formatting = null_ls.builtins.formatting

		null_ls.setup({
			sources = {
				diagnostics.eslint_d.with({ -- js/ts linter
					condition = function(utils)
						return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
					end,
				}),
				diagnostics.stylelint, -- CSS linter
				formatting.black, -- python formatter
				-- formatting.blackd, -- python formatter
				formatting.csharpier, -- c# formatter
				formatting.prettierd, -- js/ts formatter
				formatting.shfmt, -- bash formatter
				formatting.stylua, -- lua formatter
			},
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}
