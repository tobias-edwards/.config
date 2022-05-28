local M = {}

local colorizer = require("colorizer")

M.setup = function()
	-- Colour highlighting for all CSS functions in all filetypes
	colorizer.setup(nil, {
		css = true,
		css_fn = true,
		mode = "background",
	})
end

return M
