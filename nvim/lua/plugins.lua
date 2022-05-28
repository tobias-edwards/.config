-- NOTE: If requiring a plugin, it will use it's default config

return {
	-- General
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("core.lualine").setup()
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
		-- Bracket autopairing
		"windwp/nvim-autopairs",
		config = function()
			require("core.autopairs").setup()
		end,
	},
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
	{ "hrsh7th/cmp-buffer" }, -- Buffer completions
	{ "hrsh7th/cmp-path" }, -- Path completions
	{ "hrsh7th/cmp-cmdline" }, -- cmdline completions
	{ "saadparwaiz1/cmp_luasnip" }, -- Snippet completions
	{ "hrsh7th/cmp-nvim-lsp" }, -- LSP suport
	{ "hrsh7th/cmp-nvim-lua" }, -- vim.lsp.* completion
	{ "b0o/schemastore.nvim" }, -- Schemas

	-- Formatting
	{
		-- Support .editorconfig
		"editorconfig/editorconfig-vim",
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("core.null-ls").setup()
		end,
		requires = { "nvim-lua/plenary.nvim" },
	},

	-- Git
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

	-- LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("core.lsp")
		end,
	},
	{ "williamboman/nvim-lsp-installer" },

	-- File tree
	{
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("core.nvim-tree").setup()
		end,
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
	},

	-- Syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("core.treesitter").setup()
		end,
		run = ":TSUpdate",
	},
	{
		-- For lit `html` and `css` template literals
		"jonsmithers/vim-html-template-literals",
		config = function()
			require("core.html-template-literals").setup()
		end,
		requires = {
			"pangloss/vim-javascript",
			"leafgarland/typescript-vim",
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("core.colorizer").setup()
		end,
	},

	-- Markdown
	{
		"preservim/vim-markdown",
		config = function()
			require("core.markdown").setup()
		end,
		requires = { { "godlygeek/tabular" } },
	},
	{
		-- Markdown preview
		"ellisonleao/glow.nvim",
		config = function()
			require("core.glow").setup()
		end,
	},

	-- Searching for stuff
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

	-- Themes and appearence
	{
		"sainnhe/gruvbox-material",
		config = function()
			require("core.gruvbox-material").setup()
		end,
	},
	{
		-- Shade inactive buffers
		"sunjon/shade.nvim",
		config = function()
			require("core.shade").setup()
		end,
	},

	-- Utilities
	{ "wbthomason/packer.nvim" }, -- Packer commands
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins
	{ "metakirby5/codi.vim" }, -- Interactive coding
	{
		-- Terminal
		"akinsho/toggleterm.nvim",
		config = function()
			require("core.toggleterm").setup()
		end,
	},
}
