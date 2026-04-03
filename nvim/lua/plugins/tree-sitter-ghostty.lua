return {
	"bezhermoso/tree-sitter-ghostty",
	dependencies = { "mason.nvim" },
	build = "make nvim_install",
	-- NOTE: After installation run, `:TSInstall ghostty`
}
