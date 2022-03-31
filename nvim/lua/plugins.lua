-- NOTE: If requiring a plugin, it will use it's default config

return {
	{ "wbthomason/packer.nvim" }, -- Packer manage itself
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins

	-- Autopairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("core.autopairs").setup()
		end,
	},

	-- Commenting
	{
		"numToStr/Comment.nvim",
		config = function()
			require("core.comment").setup()
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	-- Completion
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("core.cmp").setup()
		end,
		-- Snippets
		requires = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{ "hrsh7th/cmp-buffer" }, -- buffer completions
	{ "hrsh7th/cmp-path" }, -- path completions
	{ "hrsh7th/cmp-cmdline" }, -- cmdline completions
	{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lsp" }, -- LSP suport
	{ "hrsh7th/cmp-nvim-lua" }, -- vim.lsp.* completion

	-- Formatting
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("core.null-ls").setup()
		end,
		requires = { "nvim-lua/plenary.nvim" },
	},

	-- Git support
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("core.gitsigns").setup()
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			require("core.fugitive").setup()
		end,
	},

	-- Gruvbox material
	{
		"sainnhe/gruvbox-material",
		config = function()
			require("core.gruvbox-material").setup()
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("core.lsp")
		end,
	},
	{ "williamboman/nvim-lsp-installer" },

	-- Nerd Tree
	{
		"scrooloose/NERDTree",
		config = function()
			require("core.nerd-tree").setup()
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("core.telescope").setup()
		end,
		requires = { { "nvim-lua/plenary.nvim" } },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		requires = {
			"nvim-telescope/telescope.nvim",
		},
		run = "make",
	},

	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("core.toggleterm").setup()
		end,
	},
	{ "tweekmonster/startuptime.vim" },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("core.treesitter").setup()
		end,
		run = ":TSUpdate",
	},
}
