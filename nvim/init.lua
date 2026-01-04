require("globals")
require("options").setup()
require("key-mappings").setup()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins", {
	-- dev = {
	-- 	path = "~/Repos",
	-- 	patterns = { "plantuml-preview.nvim" },
	-- 	fallback = false, -- Fallback to git when local plugin doesn't exist
	-- },
	change_detection = {
		enabled = true, -- Hot reload UI on changes
		notify = false, -- Notifications are annoying
	},
})
