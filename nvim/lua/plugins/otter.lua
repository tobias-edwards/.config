return {
	"jmbuhr/otter.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		vim.api.nvim_create_user_command("OtterActivate", function()
			local otter = require("otter")
			local languages = nil
			local completion = true
			local diagnostics = true
			local tsquery = nil
			otter.activate(languages, completion, diagnostics, tsquery)
    end, {})
	end,
	opts = {},
}
