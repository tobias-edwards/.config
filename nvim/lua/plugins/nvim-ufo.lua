return {
	"kevinhwang91/nvim-ufo",
	config = function()
		vim.o.foldcolumn = "0" -- Hide fold indicators in gutter
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		})
	end,
	-- keys = {
		-- {
		-- 	"zc",
		-- 	function()
		-- 		-- TODO: How to enable and succeed with first fold request?
		-- 		-- Currently this will load the plugin on 'zc' but fail the first fold attempt as "No fold found"
		-- 	end,
		-- 	desc = "Start nvim-ufo on (failed) close current fold attempt",
		-- 	mode = "n",
		-- },
	-- },
	dependencies = { "kevinhwang91/promise-async" },

	-- zc - close current fold
	-- zo - open current fold
	-- zR - open all folds
	-- zM - close all folds
}
