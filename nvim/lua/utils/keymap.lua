local M = {}

M.set = function(modal_key_maps)
	local options = {
		noremap = true, -- No recursive mapping
		silent = true, -- Execute without message history
	}

	for mode, key_maps in pairs(modal_key_maps) do
		for lhs, rhs in pairs(key_maps) do
			if type(rhs) == "table" then
				options = rhs[2]
				rhs = rhs[1]
			end
			vim.keymap.set(mode, lhs, rhs, options)
		end
	end
end

return M
