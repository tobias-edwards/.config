local M = {}

local MODES = require("utils.constants").MODES

local key_maps = {
	[MODES.terminal] = {
		-- Entering NORMAL mode
		["<esc>"] = [[<C-\><C-n>]],
		["jk"] = [[<C-\><C-n>]],
		["kj"] = [[<C-\><C-n>]],

		-- Navigate from terminal to other windows
		["<C-h>"] = [[<C-\><C-n><C-W>h]],
		["<C-j>"] = [[<C-\><C-n><C-W>j]],
		["<C-k>"] = [[<C-\><C-n><C-W>k]],
		["<C-l>"] = [[<C-\><C-n><C-W>l]],
	},
}

local setup = {
	close_on_exit = true,
	direction = "horizontal", -- | 'horizontal' | 'vertical' | 'window' | 'float'
	hide_numbers = true, -- Hide column numbers
	insert_mappings = true, -- Whether or not the open mapping applies in insert mode
	on_open = function()
		local keymap = require("utils.keymap")
		keymap.set(key_maps)
	end,
	open_mapping = [[<C-t>]],
	persist_size = true, -- Keeps the terminal size when toggled off/on
	size = 25, -- Can also be a function({ direction = "horizontal" | "vertical" | ... })
	shade_terminals = false, -- Background colour to blend with editor background
	-- shading_factor = 1 | 2 | 3,
	start_in_insert = true,
	terminal_mappings = true, -- Whether or not the open mapping applies in the opened terminals
}

M.setup = function()
	require("toggleterm").setup(setup)
end

return M
