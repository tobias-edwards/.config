function enter_normal_mode()
	vim.cmd.stopinsert()
end

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- Prevents LSP/Treesitter from automatically attaching to large buffers
		bigfile = {
			enabled = true,
			size = 1.5 * 1024 * 104, -- 1.5MB
			line_length = 1000, -- average line length, useful for minified files
		},

		git = { enabled = true },

		-- explorer = { enabled = true },
		-- input = { enabled = true },

		picker = {
			enabled = true,
			win = {
				input = {
					keys = {
						["<C-p>"] = { "history_back", mode = { "i", "n" } },
						["<C-n>"] = { "history_forward", mode = { "i", "n" } },
					},
				},
			},
		},
		-- notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		-- { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
		-- { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },

		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<C-p>",
			function()
				Snacks.picker.files({
					cwd = true,
				})
			end,
			desc = "Smart Find Files",
		},
		{
			"<C-g>",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},

		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},

		-- git
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log({
					on_show = function()
						enter_normal_mode()
					end,
				})
			end,
			desc = "Git Log",
		},
		{
			"<leader>gf",
			function()
				Snacks.picker.git_log_file({
					on_show = function()
						enter_normal_mode()
					end,
				})
			end,
			desc = "Git Log File",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff({
					on_show = function()
						enter_normal_mode()
					end,
				})
			end,
			desc = "Git Diff (Hunks)",
		},
		{
			"<leader>uC",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions({
					on_show = function()
						enter_normal_mode()
					end,
				})
			end,
			desc = "Goto Definition",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references({
					on_show = function()
						enter_normal_mode()
					end,
				})
			end,
			nowait = true,
			desc = "References",
		},
	},
}
