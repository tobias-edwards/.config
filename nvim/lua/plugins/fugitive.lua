return {
	"tpope/vim-fugitive",
	cmd = { "Git" },
	config = function()
		-- For quickfix list: <author> <commit subject>
		vim.g.fugitive_summary_format = "%an\t%s"
	end,
	keys = {
		{
			"<leader>gb",
			"<cmd>:Git blame<cr>",
			desc = "fugitive: blame",
			mode = "n",
		},
		{
			"<leader>gl",
			function()
				-- Keep track of original modifiable file
				require("harpoon.mark").add_file()
				vim.cmd("0Gclog")
			end,
			desc = "fugitive: log",
			mode = "n",
		},
	},
}
