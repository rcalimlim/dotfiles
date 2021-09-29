call plug#begin(stdpath('data') . '/plugged')
" lsp
Plug 'neovim/nvim-lspconfig' " base lsp config for nvim
Plug 'nvim-lua/completion-nvim' " autocompletion
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils' " ts-completion and autoimports

" general
Plug 'morhetz/gruvbox' " gruvbox color scheme
Plug 'tpope/vim-sensible' " widely-used, basic vim configuration
Plug 'tpope/vim-sleuth' " auto-configure indentation settings
Plug 'tpope/vim-commentary' " easy commenting
Plug 'tpope/vim-unimpaired' " handy navigation (SCM conflict markers, etc.)
Plug 'vim-airline/vim-airline' " nice status bar
Plug 'junegunn/goyo.vim' " center buffer
Plug 'tpope/vim-fugitive' " git support

" javascript
Plug 'kyazdani42/nvim-web-devicons' " icons for diagnostic list
Plug 'folke/trouble.nvim' " list diagnostics

" language help
Plug 'sheerun/vim-polyglot' " many language packs
Plug 'rust-lang/rust.vim' " rust
Plug 'niftylettuce/vim-jinja' " nunjucks
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " markdown preview

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
set omnifunc=syntaxcomplete#Complete

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

" lsp language server init
lua <<EOF
require'lspconfig'.bashls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.texlab.setup{}
require'lspconfig'.tsserver.setup{
  on_attach = function(client, bufnr)
    local ts_utils = require("nvim-lsp-ts-utils")

    -- defaults
    ts_utils.setup {
        debug = false,
        disable_commands = false,
        enable_import_on_completion = true,

        -- import all
        import_all_timeout = 5000, -- ms
        import_all_priorities = {
            buffers = 4, -- loaded buffer names
            buffer_content = 3, -- loaded buffer content
            local_files = 2, -- git files or files with relative path markers
            same_file = 1, -- add to existing import statement
        },
        import_all_scan_buffers = 100,
        import_all_select_source = false,

        -- eslint
        eslint_enable_code_actions = true,
        eslint_enable_disable_comments = true,
        eslint_bin = "eslint",
        eslint_enable_diagnostics = false,
        eslint_opts = {},

        -- formatting
        enable_formatting = false,
        formatter = "prettier",
        formatter_opts = {},

        -- update imports on file move
        update_imports_on_move = false,
        require_confirmation_on_move = false,
        watch_dir = nil,

        -- filter diagnostics
        filter_out_diagnostics_by_severity = {},
        filter_out_diagnostics_by_code = {},
    }

    -- required to fix code action ranges and filter diagnostics
    ts_utils.setup_client(client)
  end
}
require'lspconfig'.vimls.setup{}
require'lspconfig'.yamlls.setup{}
EOF
