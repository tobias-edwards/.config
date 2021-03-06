local fn = vim.fn

-- Automatically install packer and set up `packer.nvim`
-- See https://github.com/wbthomason/packer.nvim#bootstrapping
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

-- Automatically run when plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Protected call to prevent error on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("packer not installed")
	return
end

return packer.startup(function(use)
	-- Import plugins here..
	local plugins = require("plugins")
	for _, plugin in ipairs(plugins) do
		use(plugin)
	end

	-- require("core.lsp")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
