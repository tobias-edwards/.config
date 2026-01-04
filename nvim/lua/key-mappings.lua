--[[ Mapping not working? Check for:
- Custom mappings:
  :[<mode>]map <key>
  e.g. :nmap K
- Default mappings:
  :h <C-l>
--]]

local M = {}

local keymap = require("utils.keymap")
local MODES = require("utils.constants").MODES

local resize_window = function(direction)
	return ":lua require('utils.resize').resize_window('" .. direction .. "')<CR>"
end

local key_maps = {
	[MODES.command_line] = {},
	[MODES.insert] = {
		["<LeftMouse>"] = "",

		-- Leave INSERT mode
		["jk"] = "<ESC>",
		["kj"] = "<ESC>",
	},
	[MODES.normal] = {
		["<LeftMouse>"] = "",

		-- Debugging plugins
		["<leader><leader>r"] = ":Lazy reload plantuml-preview<CR>:PlantumlPreviewOpen<CR>",
		["<leader>m"] = ":messages<CR>",

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

		-- Yank filename of current buffer
		-- TODO: Include root in front
		["<leader>y%"] = ':let @+ = expand("%")<CR>',

		-- Unbind join lines command from accidentally triggering
		-- Only use in visual-select mode
		["J"] = "",

		-- Quickfix navigation
		["<leader>qn"] = ":cnext<CR>",
		["<leader>qp"] = ":cprevious<CR>",
		["<leader>qq"] = ":cclose<CR>",

		-- Quick find and replace
		["<leader>r"] = ":%s/",

		-- Remove highlights
		["<leader>h"] = ":noh<CR>",
	},
	[MODES.visual_select] = {
		-- Stay in indent mode
		["<"] = "<gv",
		[">"] = ">gv",

		-- Quick find and replace (in visually selected region)
		-- TODO: Open command line to prevent from words beginning with C/c from 'changing'
		["<leader>r"] = ":s/\\%V",

		-- Hang on to register content when pasting in VISUAL mode
		-- keymap('v', 'p', '"_dP')
		-- keymap('v', 'P', '"_dP')
	},
	[MODES.visual] = {
		["<M-c>"] = '"+y',

		-- Move text up and down in VISUAL-BLOCK mode
		["<C-j>"] = ":move '>+1<CR>gv-gv",
		["<C-k>"] = ":move '<-2<CR>gv-gv",
	},
}

local set_leader = function()
	keymap.set({ [""] = { ["<Space>"] = "<Nop>" } })
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "
end

M.setup = function()
	set_leader()
	keymap.set(key_maps)
end

return M
