return {
	-- Required in order for :RustFmt to work
	-- See https://github.com/rust-lang/rust.vim/issues/461#issuecomment-1005313227
	"rust-lang/rust.vim",
	ft = { "rust" },
	config = function()
		-- Format on save
		vim.g.rustfmt_autosave = 1
	end,
}
