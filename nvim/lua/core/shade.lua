local M = {}

local shade = require("shade")

M.setup = function()
	-- Dim inactive buffers
	shade.setup({
		overlay_opacity = 80, -- x/100 opacity of inactive buffers
		opacity_step = 1,
	})
end

return M
