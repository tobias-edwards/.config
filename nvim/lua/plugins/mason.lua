return {
	{
		"mason-org/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason-lspconfig.nvim",
			"b0o/schemastore.nvim", -- Schemas. TODO: Move this to dep on jsonls only
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"jsonls", -- npm i -g vscode-langservers-extracted
					"lua_ls",
					"ts_ls",
				},
			})

			-- Shared LSP keymaps
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover({ border = "single" })
			end)
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "gl", function()
				vim.diagnostic.open_float({ border = "single", scope = "line" })
			end)
			vim.keymap.set("n", "ga", vim.lsp.buf.code_action)

			-- vim.keymap.set("n", "gr", function()
			-- 	vim.lsp.buf.references()
			-- end)

			-- vim.lsp.set_log_level("debug") -- debug mode via :LspLog
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = {
			-- Also Mason ^
			"nvimtools/none-ls.nvim",
			"nvimtools/none-ls-extras.nvim",
			"lukas-reineke/lsp-format.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				automatic_installation = false,
				ensure_installed = { "prettier", "stylua" },
				handlers = {},
			})

			-- Sync format on save
			local config = {}
			for _, v in pairs(vim.fn.getcompletion("", "filetype")) do
				config[v] = { sync = true }
			end
			require("lsp-format").setup(config)

			require("null-ls").setup({
				sources = {}, -- Always empty. Primary source of truth is mason-null-ls
				on_attach = function(client, _)
					require("lsp-format").on_attach(client)
				end,
			})
		end,
	},
}
