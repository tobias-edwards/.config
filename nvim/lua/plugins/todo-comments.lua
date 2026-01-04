return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = false,
		keywords = {
			FIX = { color = "#ea6962" },
			TODO = { color = "#a9b665" },
			HACK = { color = "#e78a4e" },
			WARN = { color = "#e78a4e" },
			PERF = { color = "#e78a4e" },
			NOTE = { color = "#7daea3" },
		},
		highlight = {
			keyword = "fg",
			after = "",
		},
	},
}
