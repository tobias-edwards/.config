local M = {}

local cmp = require("cmp")
local luasnip = require("luasnip")

-- Icons: https://www.nerdfonts.com/cheat-sheet
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local setup = {
	-- Completion item documentation border
	documentation = {
		border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
	formatting = {
		-- Order of completion item sections:
		-- kind (icon), abbr (completion_item), menu (source)
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item) -- (entry, vim_item)
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])

			-- Map menu (source) to visible string in completion item
			vim_item.menu = ({
				nvim_lsp = "[nvim_lsp]",
				nvim_lua = "[nvim_lua]",
				luasnip = "[luasnip]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	mapping = {
		-- Navigate completion items
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),

		-- Scroll through completion item docs
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),

		-- Exit completion popup
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),

		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<TAB>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),

		-- NOTE: Don't know what these are for
		-- ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
	},
	-- Source configurations, in order of priority
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		-- { name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
	snippet = {
		expand = function(args)
			-- Insert snippets here...
			luasnip.lsp_expand(args.body)
		end,
	},
}

M.setup = function()
	require("luasnip/loaders/from_vscode").lazy_load()
	cmp.setup(setup)
end

return M
