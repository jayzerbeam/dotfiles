return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-path",
		"lukas-reineke/cmp-rg",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-u>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "buffer", keyword_length = 5 }, -- text within current buffer
				{ name = "calc" },
				{ name = "luasnip" }, -- snippets
				{ name = "nvim_lsp" }, -- lsp
				{ name = "path" }, -- file system paths
				{ name = "rg", keyword_length = 5 },
			}),
			-- configure lspkind for vs-code like icons
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 80,
					mode = "symbol_text",
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
