-- NOTE: If requiring a plugin, it will use it's default config

-- TODO:
-- TODO: Handle colours when hex is highlighted
-- Plug 'ap/vim-css-color'
-- Plug 'jasonshell/vim-svg-indent'
-- Plug 'sheerun/vim-polyglot'
-- Plug 'mattn/emmet-vim'
--[[ " To use: <leader> ,

" Trigger key
let g:user_emmet_leader_key='<Leader>'

" Only enable normal mode functions
let g:user_emmet_mode='n'     ]]

-- Plug 'godlygeek/tabular'
-- Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
-- Plug 'plasticboy/vim-markdown'

return {
	-- General
	{ "wbthomason/packer.nvim" }, -- Packer manage itself
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins
	{
		"rcarriga/nvim-notify",
		config = function()
			require("core.notify").setup()
		end,
	},

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
	{ "b0o/schemastore.nvim" }, -- Schemas

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

	-- Interactive coding
	{ "metakirby5/codi.vim" },

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

	-- Themes
	{
		"sainnhe/gruvbox-material",
		config = function()
			require("core.gruvbox-material").setup()
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("core.treesitter").setup()
		end,
		run = ":TSUpdate",
	},
	-- Syntax highlighting for lit
	{
		"jonsmithers/vim-html-template-literals",
		branch = "dev",
		requires = {
			"pangloss/vim-javascript",
			"leafgarland/typescript-vim",
		},
	},
}
