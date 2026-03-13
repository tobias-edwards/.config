local default_config = {
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
		lualine_x = {
			{
				"searchcount",
				maxcount = 999,
				timeout = 500,
			},
		},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
}

local detailed_config = {
	sections = {
		lualine_a = {},
		lualine_b = { "branch" },
		lualine_c = {
			{
				"filename",
				path = 1,
			},
		},
		lualine_x = {
			{
				"searchcount",
				maxcount = 999,
				timeout = 500,
			},
		},
		lualine_y = {},
	},
}

local toggle_detailed_config = function()
	local is_default = true
	local keymap = require("utils.keymap")
	local MODES = require("utils.constants").MODES

	keymap.set({
		[MODES.normal] = {
			["<Leader>l"] = function()
				require("lualine").setup(is_default and detailed_config or default_config)
				is_default = not is_default
			end,
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup(default_config)
		toggle_detailed_config()
	end,
}
