return {
	"ruifm/gitlinker.nvim",
	config = function()
		require("gitlinker").setup({
			callbacks = {
				["github.com"] = function(url_data)
					-- print("repo", url_data.repo)
					-- TODO: Set up enterprise URL. Check for presence of 'sky-uk'
					return require("gitlinker.hosts").get_github_type_url(url_data)
				end,
			},
			mappings = "<leader>gu",
		})
	end,
	keys = {
		{ "<leader>gu", mode = { "n", "v" } },
	},
	dependencies = { "nvim-lua/plenary.nvim" },
}
