local M = {}

local default_options = {
	clipboard = "unnamedplus", -- Allow clipboard access
	cmdheight = 0, -- Number of lines for command-line
	conceallevel = 0, -- Do not conceal text
	cursorline = true, -- Highlight the current line
	expandtab = true, -- Converts tabs to spaces
	fileencoding = "utf-8",
	laststatus = 3, -- Single global status at the bottom for all windows
	mouse = "nv", -- Enable mouse support (for scrolling!)
	mousescroll = "ver:1,hor:1", -- Scroll one line at a time with mouse wheel
	number = true, -- Show line numbers
	relativenumber = true, -- Show relative line numbers
	scrolloff = 8, -- Minimum number of lines to keep above/below cursor
	shiftwidth = 2, -- Number of spaces per indent
	showmode = false, -- Hide editor mode
	showtabline = 0, -- Always show tabline (at top)
	signcolumn = "yes:1", -- Always show to prevent gitsigns shifting buffers on new changes
	splitbelow = true, -- Horizontal splits go below the current window
	splitright = true, -- Vertical splits go to the right of the current window
	statusline = "%<%f", -- Only show the file name in the status
	swapfile = false, -- Disable swap file recovery (known to cause issues with hot-reloading)
	tabstop = 2, -- Number of spaces per tab
	termguicolors = true, -- Enables 24-bit RGB color
	timeoutlen = 250, -- Time (ms) to wait for mapped key sequences ('jk' I'm looking at you)
	updatetime = 200, -- Time (ms) to update (completion, highlighting, etc.)
	wrap = true, -- Word wrap
}

M.set_options = function(options)
	for k, v in pairs(options) do
		vim.o[k] = v
	end
end

-- Workaround when cmdheight=0, see https://github.com/neovim/neovim/issues/19193
local show_macro_recording_indicator = function()
	local cmdheightaugroup = vim.api.nvim_create_augroup("cmdheight", { clear = true })

	vim.api.nvim_create_autocmd("RecordingEnter", {
		group = cmdheightaugroup,
		callback = function()
			vim.o.cmdheight = 1
		end,
	})
	vim.api.nvim_create_autocmd("RecordingLeave", {
		group = cmdheightaugroup,
		callback = function()
			vim.o.cmdheight = 0
		end,
	})
end

M.setup = function()
	M.set_options(default_options)
	vim.diagnostic.config({
		float = {
			focusable = true,
			style = "minimal",
			border = "single",
			source = "always",
			header = "",
			prefix = "",
		},
		severity_sort = true, -- Sort diagnostics by severity
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.INFO] = "󰋼",
				[vim.diagnostic.severity.HINT] = "󰌵",
			},
		},
		underline = true, -- Underline diagnostics
		update_in_insert = false, -- Update diagnostics while in INSERT mode
		virtual_text = false, -- Show diagnostic messages in editor
	})
	show_macro_recording_indicator()
end

return M
