" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    " Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
    " Plug 'ryanoasis/vim-devicons' " Icons without colours

    Plug 'Pocco81/TrueZen.nvim'
    
    Plug 'ellisonleao/glow.nvim'

    Plug 'neovim/nvim-lspconfig'

    " Toggle terminal within session
    Plug 'akinsho/toggleterm.nvim'

    " TODO: Handle colours when hex is highlighted
    Plug 'ap/vim-css-color'

    " Automatic closing parentheses for (, [ and {
    Plug 'jiangmiao/auto-pairs'

    " Interactive coding
    Plug 'metakirby5/codi.vim'

    Plug 'jasonshell/vim-svg-indent'

    " Code-completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Prettier - slow?
    " Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    
    " TODO onwards: Parser thing
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    
    " Syntax Support
    Plug 'sheerun/vim-polyglot'
     
    " Search stuff
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " JSDoc stuff
    Plug 'heavenshell/vim-jsdoc', { 
      \ 'for': ['javascript', 'javascript.jsx','typescript'], 
      \ 'do': 'make install'
    \}

    " Emmet
    Plug 'mattn/emmet-vim'

    Plug 'tpope/vim-commentary'
    " Commenting code
    Plug 'preservim/nerdcommenter'

    " Themes
    Plug 'ayu-theme/ayu-vim' 
    Plug 'morhetz/gruvbox'
    Plug 'sainnhe/gruvbox-material'
    Plug 'sainnhe/sonokai'

    " Git stuff to sort out
    " Supports Git only, if using others consider vim-signify
    " Plug 'mhinz/vim-signify'
    Plug 'airblade/vim-gitgutter'

    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    
    " File Explorer
    Plug 'scrooloose/NERDTree'

    " Vim markdown stuff
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'

    " Live updating markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

    " Only colour the current section
    Plug 'junegunn/limelight.vim'
    " Zen mode editing
    Plug 'junegunn/goyo.vim'
    
    " Tools
    " Livedown
    Plug 'shime/vim-livedown'    

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall
  \| endif

