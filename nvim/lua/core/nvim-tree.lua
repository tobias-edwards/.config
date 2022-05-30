local M = {}

local keymap = require("utils.keymap")
local MODES = require("utils.constants").MODES

local key_maps = {
	[MODES.normal] = {
		["<C-n>"] = ":NvimTreeToggle<CR>",
		-- ["<leader>r"] = ":NvimTreeRefresh<CR>",
	},
}

M.setup = function()
	require("nvim-tree").setup({
		git = {
			enable = true,
			ignore = true,
			timeout = 200, -- May not be enough for large monorepos
		},
		open_on_setup = false, -- Open tree on start when no file
		diagnostics = {
			enable = true,
			show_on_dirs = false,
			icons = {
				error = "",
				hint = "",
				info = "",
				warning = "",
			},
		},
		view = {
			mappings = {
				custom_only = true,
				list = {
					{ key = "<C-[>", action = "dir_up" },
					{ key = "<C-]>", action = "cd" },
					{ key = "<C-k>", action = "toggle_file_info" },
					{ key = "<CR>", action = "edit" },
					{ key = "?", action = "toggle_help" },
					{ key = "C", action = "collapse_all" },
					{ key = "F", action = "clear_live_filter" },
					{ key = "H", action = "toggle_dotfiles" },
					{ key = "R", action = "refresh" },
					{ key = "Y", action = "copy_path" },
					{ key = "a", action = "create" },
					{ key = "c", action = "copy" },
					{ key = "d", action = "remove" },
					{ key = "f", action = "live_filter" },
					{ key = "gy", action = "copy_absolute_path" },
					{ key = "o", action = "system_open" }, -- Open file explorer
					{ key = "p", action = "paste" },
					{ key = "r", action = "rename" },
					{ key = "x", action = "cut" },
					{ key = "y", action = "copy_name" },
				},
			},
		},
	})
	keymap.set(key_maps)
end

return M
