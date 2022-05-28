local M = {}

-- macOS keyboard setting:
-- Key Repeat: Fast-1
-- Delay Until Repeat: Short-1

local default_options = {
	clipboard = "unnamedplus", -- Allow clipboard access
	cmdheight = 1, -- Number of lines for command-line
	conceallevel = 0, -- Do not conceal text
	cursorline = true, -- Highlight the current line
	expandtab = true, -- Converts tabs to spaces
	fileencoding = "utf-8",
	laststatus = 3, -- Single global status at the bottom for all windows
	mouse = "", -- Disable mouse support
	number = true, -- Show line numbers
	relativenumber = true, -- Show relative line numbers
	scrolloff = 8, -- Minimum number of lines to keep above/below cursor
	shiftwidth = 2, -- Number of spaces per indent
	showmode = false, -- Hide editor mode
	showtabline = 2, -- Always show tabline (at top)
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

M.setup = function()
	M.set_options(default_options)
end

return M
