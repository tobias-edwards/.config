return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			autopairs = { enable = true },
			tree_docs = { enable = true },
			ensure_installed = {
				"css",
				"hcl",
				"html",
				"javascript",
				"json",
				"lua",
				"python",
				"tsx",
				"typescript",
			},
			highlight = {
				enable = true,
				disable = function(lang, buf)
					-- Disable slow treesitter for large files
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				additional_vim_regex_highlighting = false, -- buggy string highlighting when true
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					node_incremental = "v",
					node_decremental = "V",
				},
			},
			ignore_install = { "" }, -- list of parsers to ignore installing
			indent = {
				enable = true,
				disable = { "yaml" },
			},
		})
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})
		vim.g.skip_ts_context_commentstring_module = true
		-- Configure parser for other filetypes
		vim.treesitter.language.register("xml", "mjml")
		vim.treesitter.language.register("hmtl", "mjml")
	end,
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-tree-docs",
	},
	build = ":TSUpdate",
}
