return {
	root_dir = function(_, callback)
		-- Disable ts_ls for Deno projects where Deno LSP should be used instead
		local deno_root = vim.fs.root(0, { "deno.json", "deno.jsonc" })
		if deno_root ~= nil then
			return nil
		end

    local ts_root = vim.fs.root(0, { "tsconfig.json", "jsconfig.json", "package.json" })
		return callback(ts_root)
	end,
	single_file_support = false,
}
