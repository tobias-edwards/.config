local M = {}

M.on_attach = function(client)
	-- Let Null-LS handle formatting (with eslint_d, prettier)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.range_document_formatting = false
end

M.opts = {
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},

	-- Start `tsserver` even when a project root cannot be found
	-- root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
	root_dir = function()
		return vim.loop.cwd()
	end,
}

return M
