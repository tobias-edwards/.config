local M = {}

local setup = {
	-- Treesitter to enhance pairing
	check_ts = true,
	ts_config = {
		-- Do not pair inside these nodes
		javascript = { "string", "template_string" },
		lua = { "string", "source" },
	},

	-- Disable pairing for these filetypes (:echo &ft to reveal filetype)
	disable_filetype = { "TelescopePrompt" },
}

M.setup = function()
	local autopairs = require("nvim-autopairs")
	autopairs.setup(setup)

	-- Insert pairs after completing a function/method in cmp
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	require("cmp").event:on(
		"confirm_done",
		cmp_autopairs.on_confirm_done({ map_char = { tex = "" } })
	)
end

return M
