call plug#begin(stdpath('data') . '/plugged')
" lsp
Plug 'neovim/nvim-lspconfig' " base lsp config for nvim
Plug 'nvim-lua/completion-nvim' " autocompletion

" general
Plug 'morhetz/gruvbox' " gruvbox color scheme
Plug 'tpope/vim-sensible' " widely-used, basic vim configuration
Plug 'tpope/vim-sleuth' " auto-configure indentation settings
Plug 'tpope/vim-commentary' " easy commenting
Plug 'tpope/vim-unimpaired' " handy navigation (SCM conflit markers, etc.)
Plug 'vim-airline/vim-airline' " nice status bar

" language help
Plug 'sheerun/vim-polyglot' " many language packs
Plug 'rust-lang/rust.vim' " rust

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

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
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

" lsp language server init
lua <<EOF
require'lspconfig'.bashls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.yamlls.setup{}
EOF
