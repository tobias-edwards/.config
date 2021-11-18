" True color support
if has("termguicolors")
    set termguicolors
endif

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

" Load part of the code on demand within ~/.config/nvim/autoload/plugged/gruvbox-material/after/ftplugin
let g:gruvbox_material_better_performance = 1

colorscheme gruvbox-material

" Increase contrast of StatusLine
hi StatusLine guibg=#504945
