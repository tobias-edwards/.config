local M = {}

local MODES = require("utils.constants").MODES

local key_maps = function(bufnr)
	return {
		[bufnr] = {
			[MODES.normal] = {
				-- Go to definition
				["gd"] = "<cmd>lua vim.lsp.buf.definition()<CR>",

				-- Get current line diagnostics
				["gl"] = "<cmd>lua vim.diagnostic.open_float({ border = 'single', scope = 'line' })<CR>",

				-- Reveals type information
				["K"] = "<cmd>lua vim.lsp.buf.hover()<CR>",

				-- Opens current diagnostics in a separate buffer (for easy copy-pasting)
				["<leader>q"] = "<cmd>lua vim.diagnostic.setloclist()<CR>",

				-- Show all references
				["gr"] = "<cmd>lua vim.lsp.buf.references()<CR>",

				-- Not sure yet...
				-- ["gD"] = "<cmd>lua vim.lsp.buf.declaration()<CR>",
				-- ["gi"] = "<cmd>lua vim.lsp.buf.implementation()<CR>",
				-- ["<C-k>"] = "<cmd>lua vim.lsp.buf.signature_help()<CR>",
			},
		},
	}
end

M.setup = function(bufnr)
	local keymap = require("utils.keymap")
	keymap.set_buf(key_maps(bufnr))

	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting_sync()' ]])
end

return M
