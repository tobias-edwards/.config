local M = {}

local notify = require("notify")

M.setup = function()
	-- Expose as default notify function
	vim.notify = notify

	-- No timeout?
	-- vim.notify(message, level, { timeout = false })
end

return M
