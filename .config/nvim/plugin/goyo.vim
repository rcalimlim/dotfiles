function! s:goyo_enter()
    let g:goyo_width=120
    set number
    set relativenumber
    set statusline=
    set statusline+=\ %f
    set statusline+=\ %m
    set signcolumn=yes:2
endfunction

function! s:goyo_leave()
    " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <leader>c <cmd>Goyo<cr>
