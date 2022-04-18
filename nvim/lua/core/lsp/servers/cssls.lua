local M = {}

M.on_attach = function(client)
	-- Let Null-LS handle formatting (with prettier)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.range_document_formatting = false

	client.config.capabilities.textDocument.completion.completionItem.snippetSupport =
		true
end

M.opts = {}

return M
