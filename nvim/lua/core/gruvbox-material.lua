-- :h gruvbox-material

local M = {}

M.setup = function()
	vim.cmd([[
    set background=dark

    " Enable bold
    let g:gruvbox_material_enable_bold = 1

    " Enable italics in comments only
    let g:gruvbox_material_enable_italic = 0
    let g:gruvbox_material_disable_italic_comment = 0

    " Behaviour for coc-highlight, vim_current_word, vim-illuminate, vim-cursorword, vim-lsp
    let g:gruvbox_material_current_word = 'bold'

    let g:gruvbox_material_background = 'medium'
    let g:gruvbox_material_palette = 'material'

    " Easier to see line numbers
    let g:gruvbox_material_ui_contrast = 'high'

    " Load part of the code on demand within ~/.config/nvim/autoload/plugged/gruvbox-material/after/ftplugin
    let g:gruvbox_material_better_performance = 1

    colorscheme gruvbox-material

    " NOTE: Overrides come AFTER setting the colorscheme
    " Increase contrast of StatusLine
    hi StatusLine guibg=#504945
  ]])
end

return M
