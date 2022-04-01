-- justinmk/vim-dirvish file browser config
-- sort folders to top
vim.api.nvim_exec([[
let g:dirvish_mode = ':sort ,^.*[\/],'
]], false)

-- use dirvish when (Explore)ing
vim.cmd(":command! -nargs=? -complete=dir Explore Dirvish <args>")
vim.cmd("command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>")
vim.cmd("command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>")
