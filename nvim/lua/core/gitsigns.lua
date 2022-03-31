local M = {}

local signs = {
	add = {
		hl = "GitSignsAdd",
		text = "+",
		numhl = "GitSignsAddNr",
		linehl = "GitSignsAddLn",
	},
	change = {
		hl = "GitSignsChange",
		text = "~",
		numhl = "GitSignsChangeNr",
		linehl = "GitSignsChangeLn",
	},
	delete = {
		hl = "GitSignsDelete",
		text = "_",
		numhl = "GitSignsDeleteNr",
		linehl = "GitSignsDeleteLn",
	},
	topdelete = {
		hl = "GitSignsDelete",
		text = "-",
		numhl = "GitSignsDeleteNr",
		linehl = "GitSignsDeleteLn",
	},
	changedelete = {
		hl = "GitSignsChange",
		text = "~",
		numhl = "GitSignsChangeNr",
		linehl = "GitSignsChangeLn",
	},
}

local on_attach = function()
	local keymap = require("utils.keymap")
	local MODES = require("utils.constants").MODES

	local key_maps = {
		[MODES.normal] = {
			["<leader>hj"] = "<cmd>lua require 'gitsigns'.next_hunk()<cr>",
			["<leader>hk"] = "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
			["<leader>hp"] = "<cmd>lua require 'gitsigns'.preview_hunk()<CR>",
			["<leader>hr"] = "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",
		},
	}

	keymap.set(key_maps)
end

M.setup = function()
	local gitsigns = require("gitsigns")
	gitsigns.setup({ on_attach = on_attach, signs = signs })
end

return M
