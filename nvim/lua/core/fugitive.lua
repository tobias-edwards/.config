local M = {}

local MODES = require("utils.constants").MODES

local key_maps = {
	[MODES.normal] = {
		["<leader>gb"] = ":Git blame<CR>",
	},
}

M.setup = function()
	local keymap = require("utils.keymap")
	keymap.set(key_maps)
end

return M
