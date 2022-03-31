local cmp_nvim_lsp = require("cmp_nvim_lsp")
local handlers = require("core.lsp.handlers")
local lsp_installer = require("nvim-lsp-installer")
local lsp_keymaps = require("core.lsp.key-mappings")
local servers = require("core.lsp.servers")

-- Add additional capabilities supported by nvim-cmp
local capabilities = cmp_nvim_lsp.update_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)

local on_attach = function(client, bufnr)
	-- :LspInfo to find currently active language servers (clients)
	local server_on_attach = servers[client.name].on_attach
	if server_on_attach ~= nil then
		server_on_attach(client)
	end

	lsp_keymaps.setup(bufnr)
	handlers.lsp_highlight_document(client)
end

-- Register a handler that will be called for each installed server when ready
lsp_installer.on_server_ready(function(server)
	local opts = {
		capabilities = capabilities,
		on_attach = on_attach,
	}

	local server_opts = servers[server.name].opts
	opts = vim.tbl_deep_extend("force", server_opts, opts)

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
