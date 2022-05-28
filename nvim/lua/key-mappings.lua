--[[ Mapping not working? Execute within that window:
- Custom mappings:
  :verbose [inv]map <C-l>
- Default mappings:
  :h <C-l> ]]

local M = {}

local MODES = require("utils.constants").MODES

local resize_window = function(direction)
	return ":lua require('utils.resize').resize_window('"
		.. direction
		.. "')<CR>"
end

local key_maps = {
	[MODES.insert] = {
		-- Leave INSERT mode
		["jk"] = "<ESC>",
		["kj"] = "<ESC>",
	},
	[MODES.normal] = {
		-- Escape with Ctrl + C
		["<C-c>"] = "<ESC>",

		-- Navigate windows
		["<C-h>"] = "<C-w>h",
		["<C-j>"] = "<C-w>j",
		["<C-k>"] = "<C-w>k",
		["<C-l>"] = "<C-w>l",

		-- Navigate buffers
		["<TAB>"] = ":bnext<CR>",
		["<S-TAB>"] = ":bprevious<CR>",

		-- Resize windows
		["<A-h>"] = resize_window("h"),
		["˙"] = resize_window("h"),
		["<A-j>"] = resize_window("j"),
		["∆"] = resize_window("j"),
		["<A-k>"] = resize_window("k"),
		["˚"] = resize_window("k"),
		["<A-l>"] = resize_window("l"),
		["¬"] = resize_window("l"),

		-- Unbind join lines command from accidentally triggering
		-- Only use in visual-select mode
		["J"] = "",

		-- Disable scroll wheel
		["<ScrollWheelUp>"] = "",
		["<2-ScrollWheelUp>"] = "",
		["<3-ScrollWheelUp>"] = "",
		["<4-ScrollWheelUp>"] = "",
		["<C-ScrollWheelUp>"] = "",
		["<ScrollWheelDown>"] = "",
		["<2-ScrollWheelDown>"] = "",
		["<3-ScrollWheelDown>"] = "",
		["<4-ScrollWheelDown>"] = "",
		["<S-ScrollWheelUp>"] = "",
		["<S-ScrollWheelDown>"] = "",
		["<C-ScrollWheelDown>"] = "",
		["<ScrollWheelLeft>"] = "",
		["<S-ScrollWheelLeft>"] = "",
		["<C-ScrollWheelLeft>"] = "",
		["<ScrollWheelRight>"] = "",
		["<S-ScrollWheelRight>"] = "",
		["<C-ScrollWheelRight>"] = "",
	},
	[MODES.visual_select] = {
		-- Stay in indent mode
		["<"] = "<gv",
		[">"] = ">gv",

		-- Hang on to register content when pasting in VISUAL mode
		-- keymap('v', 'p', '"_dP')
		-- keymap('v', 'P', '"_dP')
	},
	[MODES.visual] = {
		-- Move text up and down in VISUAL-BLOCK mode
		["<C-j>"] = ":move '>+1<CR>gv-gv",
		["<C-k>"] = ":move '<-2<CR>gv-gv",
	},
}

M.setup = function()
	local keymap = require("utils.keymap")

	-- Set leader
	keymap.set({ [""] = { ["<Space>"] = "<Nop>" } })
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "

	keymap.set(key_maps)
end

return M
