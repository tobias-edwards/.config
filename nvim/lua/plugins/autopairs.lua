return {
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({
			check_ts = true, -- Use Treesitter to check for pair
			ts_config = {
				-- Do not pair inside these nodes
				javascript = { "string", "template_string" },
				lua = { "string", "source" },
			},
			-- Disable pairing for these filetypes. `:echo &ft` to reveal filetype
			disable_filetype = { "TelescopePrompt" },
		})
	end,

	--- @diagnostic disable: different-requires
	-- local cmp = require("cmp")
	-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")

	-- Insert pairs after completing a function/method in cmp
	-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
}
