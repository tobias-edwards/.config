return {
	"simrat39/rust-tools.nvim",
	ft = { "rust" },
	config = function()
		local rt = require("rust-tools")
		rt.setup({
			server = {
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "ga", rt.hover_actions.hover_actions, { buffer = bufnr })
				end,
			},
			tools = {
				hover_actions = {
					auto_focus = true,
				},
			},
		})
		rt.hover_actions.hover_actions()
	end,
}
