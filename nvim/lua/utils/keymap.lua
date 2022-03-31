local M = {}

M.set_buf = function(buf_modal_key_maps)
	local default_options = {
		noremap = true, -- No recursive mapping
		silent = true, -- Execute without message history
	}

	for bufnr, modal_key_maps in pairs(buf_modal_key_maps) do
		for mode, key_maps in pairs(modal_key_maps) do
			for key, command in pairs(key_maps) do
				if type(command) == "table" then
					command, default_options = command
				end
				vim.api.nvim_buf_set_keymap(
					bufnr,
					mode,
					key,
					command,
					default_options
				)
			end
		end
	end
end

M.set = function(modal_key_maps)
	local default_options = {
		noremap = true, -- No recursive mapping
		silent = true, -- Execute without message history
	}

	for mode, key_maps in pairs(modal_key_maps) do
		for key, command in pairs(key_maps) do
			if type(command) == "table" then
				command, default_options = command
			end
			vim.api.nvim_set_keymap(mode, key, command, default_options)
		end
	end
end

return M
