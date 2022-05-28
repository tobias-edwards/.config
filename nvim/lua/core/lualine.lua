local M = {}

local lualine = require("lualine")

M.setup = function()
	-- TODO: Check support for 'winbar' in the future
	lualine.setup({
		options = { theme = "gruvbox-material" },
		sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				{
					"filename",
					path = 1, -- Relative path
				},
			},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		-- Treat tabline as blank line for space
		tabline = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	})
end

return M
