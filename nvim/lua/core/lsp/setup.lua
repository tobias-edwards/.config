local M = {}

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
}

local set_diagnostic_signs = function()
	for _, sign in ipairs(signs) do
		vim.fn.sign_define(
			sign.name,
			{ texthl = sign.name, text = sign.text, numhl = "" }
		)
	end
end

local config = {
	float = {
		focusable = false,
		style = "minimal",
		border = "single",
		source = "always",
		header = "",
		prefix = "",
	},
	severity_sort = true, -- Sort diagnostics by severity
	signs = {
		active = signs,
	},
	underline = true, -- Underline diagnostics
	update_in_insert = false, -- Update diagnostics while in INSERT mode
	virtual_text = false, -- Show diagnostic messages in editor
}

M.setup = function()
	set_diagnostic_signs()
	vim.diagnostic.config(config)

	-- Handle responses and notifications from LSP servers
	vim.lsp.handlers["textDocument/hover"] =
		vim.lsp.with(
			vim.lsp.handlers.hover,
			{
				border = "single",
			}
		)
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{
			border = "single",
		}
	)
end

return M
