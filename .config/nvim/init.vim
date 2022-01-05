call plug#begin(stdpath('data') . '/plugged')
" lsp
Plug 'neovim/nvim-lspconfig' " base lsp config for nvim
Plug 'williamboman/nvim-lsp-installer' " lsp server manager
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils' " ts-completion and autoimports
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp' " autocompletion
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip' " snippets

" nvim performance benchmarking
Plug 'tweekmonster/startuptime.vim'

" general
Plug 'morhetz/gruvbox' " gruvbox color scheme
Plug 'tpope/vim-sensible' " widely-used, basic vim configuration
Plug 'tpope/vim-sleuth' " auto-configure indentation settings
Plug 'tpope/vim-commentary' " easy commenting
Plug 'tpope/vim-unimpaired' " handy navigation (SCM conflict markers, etc.)
Plug 'vim-airline/vim-airline' " nice status bar
Plug 'tpope/vim-fugitive' " git support
" Plug 'junegunn/goyo.vim' " center buffer

" javascript
Plug 'folke/trouble.nvim' " list diagnostics

" telescope
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " dep
Plug 'nvim-lua/plenary.nvim' " dep
Plug 'nvim-telescope/telescope.nvim' " file list traverser

" dirvish file browser
Plug 'justinmk/vim-dirvish'

" javascript
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

" general config
filetype plugin indent on

" remap
let mapleader = " "
nnoremap <Leader>w <C-w>

" colorscheme
syntax enable
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox

lua require("lsp")
