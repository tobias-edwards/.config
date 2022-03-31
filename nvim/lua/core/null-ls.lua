local M = {}

local null_ls = require("null-ls")

local on_attach = function(client)
	-- Format on save
	if client.resolved_capabilities.document_formatting then
		vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
	end
end

local sources = {
	null_ls.builtins.formatting.stylua.with({
		extra_args = {
			"--config-path",
			vim.fn.expand("~/.config/analysers/stylua.toml"),
		},
	}),
	null_ls.builtins.formatting.eslint_d,
	null_ls.builtins.formatting.prettierd,
}

M.setup = function()
	null_ls.setup({
		on_attach = on_attach,
		sources = sources,
	})
end

return M
