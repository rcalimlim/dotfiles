" strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
