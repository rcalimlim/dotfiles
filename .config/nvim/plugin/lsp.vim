let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

nnoremap <leader>vd :lua vim.lsp.buf.definition()<cr>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<cr>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<cr>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<cr>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<cr>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<cr>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<cr>
nnoremap <leader>vn :lua vim.diagnostic.goto_next()<cr>
nnoremap <leader>vp :lua vim.diagnostic.goto_prev()<cr>
nnoremap <leader>vt :TroubleToggle<cr>
nnoremap <leader>vll :call LspLocationList()<cr>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
