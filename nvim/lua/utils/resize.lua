local M = {}

-- Natural window resizing with [hjkl]
local function resize_window_command(direction)
	local winnr = vim.fn.winnr
	local current_window = winnr()

	local resize_diff = 2
	local decrease_horizontal = ":resize -" .. resize_diff .. "<CR>"
	local increase_horizontal = ":resize +" .. resize_diff .. "<CR>"
	local decrease_vertical = ":vertical :resize -" .. resize_diff .. "<CR>"
	local increase_vertical = ":vertical :resize +" .. resize_diff .. "<CR>"

	-- Resize window in the direction of [hjkl] regardless of window position
	if direction == "h" then
		if current_window == winnr("l") then
			return increase_vertical
		else
			return decrease_vertical
		end
	elseif direction == "j" then
		if current_window == winnr("j") then
			return decrease_horizontal
		else
			return increase_horizontal
		end
	elseif direction == "k" then
		if current_window == winnr("j") then
			return increase_horizontal
		else
			return decrease_horizontal
		end
	elseif direction == "l" then
		if current_window == winnr("l") then
			return decrease_vertical
		else
			return increase_vertical
		end
	end
end

M.resize_window = function(direction)
	local resize = resize_window_command(direction)
	vim.api.nvim_command(resize)
end

return M
