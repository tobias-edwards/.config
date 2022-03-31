local M = {}

local configs = require("nvim-treesitter.configs")

local setup = {
	autopairs = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = true,
	},
	ensure_installed = {
		"css",
		"html",
		"javascript",
		"json",
		"lua",
		"python",
	},
	highlight = {
		disable = { "" }, -- list of language that will be disabled
		enable = true, -- false will disable the whole extension
		additional_vim_regex_highlighting = false, -- buggy string highlighting when true
	},
	ignore_install = { "" }, -- list of parsers to ignore installing
	indent = { enable = true, disable = { "yaml" } },
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
}

M.setup = function()
	configs.setup(setup)
end

return M
