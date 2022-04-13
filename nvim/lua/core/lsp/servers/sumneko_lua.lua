local M = {}

M.on_attach = function(client)
	-- Let Null-LS handle formatting (with stylua)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.range_document_formatting = false
end

M.opts = {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}

return M
