return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup({ ---@diagnostic disable-line: redundant-parameter
			on_attach = function()
				local opts = {
					noremap = true, -- No recursive mapping
					silent = true, -- Execute without message history
				}

				vim.keymap.set("n", "<leader>gj", function()
					gitsigns.next_hunk()
				end, opts)
				vim.keymap.set("n", "<leader>gk", function()
					gitsigns.prev_hunk()
				end, opts)
				vim.keymap.set("n", "<leader>gp", function()
					gitsigns.preview_hunk()
				end, opts)
				vim.keymap.set("n", "<leader>gr", function()
					gitsigns.reset_hunk()
				end, opts)
			end,
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "-" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
		})
	end,
}
