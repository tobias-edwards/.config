local M = {}

local keymap = require("utils.keymap")
local MODES = require("utils.constants").MODES

local key_maps = {
	[MODES.normal] = {
		-- Preview markdown
		["<leader>p"] = ":Glow<CR>",
	},
}

M.setup = function()
	keymap.set(key_maps)
end

return M
