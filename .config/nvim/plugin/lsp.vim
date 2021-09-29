let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

fun! LspLocationList()
    " lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
endfun

nnoremap <leader>vd :lua vim.lsp.buf.definition()<cr>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<cr>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<cr>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<cr>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<cr>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<cr>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<cr>
nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<cr>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<cr>
nnoremap <leader>vp :lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <leader>vt :TroubleToggle<cr>
nnoremap <leader>vll :call LspLocationList()<cr>

augroup THE_PRIMEAGEN_LSP
    autocmd!
    autocmd! BufWrite,BufEnter,InsertLeave * :call LspLocationList()
augroup END

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
