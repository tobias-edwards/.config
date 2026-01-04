return {
	root_dir = function(_, callback)
		local deno_root = vim.fs.root(0, { "deno.json", "deno.jsonc" })
		if deno_root then
			callback(deno_root)
		end
	end,
}
