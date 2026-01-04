return {
	"tobias-edwards/plantuml-preview.nvim",
	config = function()
		require("plantuml-preview").setup({
			port = 3030,
		})
	end,
}
