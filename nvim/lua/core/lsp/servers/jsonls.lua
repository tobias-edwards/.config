local M = {}

M.on_attach = function(client)
	-- NOTE: resolved_capabilities refers to the server not the Neovim client

	client.config.capabilities.textDocument.completion.completionItem.snippetSupport =
		true

	-- Let Null-LS handle formatting (with prettier)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.range_document_formatting = false

	-- TODO: Disable autopairs when used with schemastore LSP completion
end

M.opts = {
	settings = {
		json = {
			schemas = require("schemastore").json.schemas({
				-- List of available schemas: https://www.schemastore.org/json/
				select = {
					".eslintrc",
					"cosmos.config.json",
					"huskyrc",
					"package.json",
					"prettierrc.json",
					"tsconfig.json",
				},
			}),
		},
	},

	-- If wanting to format with jsonls, see https://github.com/neovim/nvim-lspconfig/issues/372#issuecomment-755992086
	-- Formatting is currently handled by Null-LS
}

return M
