return {
	"hrsh7th/nvim-cmp",
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			experimental = {
				ghost_text = false,
			},
			formatting = {
				fields = { "abbr", "menu" },
				format = function(entry, vim_item)
					local source_menu_name = {
						nvim_lsp = "LSP",
						nvim_lua = "LSP",
						conjure = "CLJ",
						supermaven = "AI",
						buffer = "Buffer",
						path = "Path",
					}
					vim_item.menu = string.format("[%s]", source_menu_name[entry.source.name])
					return vim_item
				end,
			},
			mapping = {
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<A-j>"] = cmp.mapping.scroll_docs(1),
				["<A-k>"] = cmp.mapping.scroll_docs(-1),
				["<TAB>"] = cmp.mapping.confirm({ select = true }),
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "supermaven" },
				{ name = "buffer" },
				{ name = "nvim_lua" }, -- vim.* completion
				{ name = "path" },
			},
			window = {
				documentation = {
					border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
				},
			},
		})

		-- Inform LSP servers of the additional capabilities supported by `nvim-cmp` to improve completion results
		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})
	end,
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
	},
}
