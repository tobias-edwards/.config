return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			-- Normal mode
			toggler = {
				line = "gcc",
				block = "gbc",
			},
			-- Visual mode
			opleader = {
				line = "gc",
				block = "gb",
			},
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	keys = {
		{ "gbc", mode = "n" },
		{ "gcc", mode = "n" },
		{ "gb", mode = "v" },
		{ "gc", mode = "v" },
	},
}
