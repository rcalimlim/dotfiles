-- dirvish file browser config
vim.g.dirvish_mod = ':sort ,^.*[/],' -- sort folders top

-- use dirvish when (Explore)ing
vim.cmd(':command! -nargs=? -complete=dir Explore Dirvish <args>')
vim.cmd('command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>')
vim.cmd('command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>')
