return {
	"nickjvandyke/opencode.nvim",
	version = "*", -- Latest stable release
	dependencies = {
		{
			-- `snacks.nvim` integration is recommended, but optional
			---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
			"folke/snacks.nvim",
			optional = true,
			input = {}, -- Enhances `ask()`
			opts = {
				picker = { -- Enhances `select()`
					actions = {
						opencode_send = function(...)
							return require("opencode").snacks_picker_send(...)
						end,
					},
					win = {
						input = {
							keys = {
								["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
							},
						},
					},
				},
			},
		},
	},
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			-- Your configuration, if any; goto definition on the type or field for details
		}

		vim.o.autoread = true -- Required for `opts.events.reload`

		vim.keymap.set({ "n", "x" }, "go", function()
			return require("opencode").operator("@this ")
		end, { desc = "Add range to opencode", expr = true })

		vim.keymap.set("n", "go", function()
			return require("opencode").operator("@this ") .. "_"
		end, { desc = "Add line to opencode", expr = true })
	end,
}
