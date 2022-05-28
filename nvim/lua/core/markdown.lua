local M = {}

M.setup = function()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "markdown" },
		callback = function()
			-- Initially collapse all folds more than one level deep
			vim.wo.foldlevel = 1
		end,
	})
end

return M
