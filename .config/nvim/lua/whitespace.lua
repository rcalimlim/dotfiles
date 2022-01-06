-- strip trailing whitespace on save
vim.api.nvim_exec([[
autocmd BufWritePre * :%s/\s\+$//e
]], false)
