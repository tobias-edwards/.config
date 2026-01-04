return {
	"kyazdani42/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			respect_buf_cwd = true,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
				ignore_list = {},
			},
			actions = {
				change_dir = {
					enable = true,
					global = true,
				},
				open_file = {
					resize_window = false,
				},
			},
			live_filter = {
				always_show_folders = false,
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 200, -- May not be enough for large monorepos
			},
			diagnostics = {
				enable = true,
				show_on_dirs = false,
				icons = {
					error = "",
					hint = "",
					info = "",
					warning = "",
				},
			},
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				vim.keymap.set("n", "<", api.tree.change_root_to_parent, opts("Up"))
				vim.keymap.set("n", ">", api.tree.change_root_to_node, opts("CD"))
				vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
				vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
				vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
				vim.keymap.set("n", "C", api.tree.collapse_all, opts("Collapse"))
				vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
				vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
				vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
				vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
				vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
				vim.keymap.set("n", "a", api.fs.create, opts("Create"))
				vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
				vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
				vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
				vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
				vim.keymap.set("n", "o", api.node.run.system, opts("Run System"))
				vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
				vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
				vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
				vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
			end,
			renderer = {
				root_folder_modifier = ":t:r",
			},
		})
	end,
	keys = {
		{ "<C-n>", ":NvimTreeToggle<CR>", desc = "nvim-tree: Toggle", mode = "n" },
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}
