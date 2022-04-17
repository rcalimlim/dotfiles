local exec = vim.api.nvim_exec -- execute Vimscript
local set = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands

-- disable default plugins for performance
vim.g.loaded_matchparen = 1
vim.g.loaded_matchit = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_man = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins = 1

-- sets
set.exrc = true
set.number = true
set.signcolumn = "yes"
set.relativenumber = true
set.hidden = true
set.errorbells = false
set.hlsearch = false
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.autoindent = true
set.smartindent = true
set.nu = true
set.wrap = false
set.swapfile = false
set.backup = false
set.undodir = "/Users/ross/.vim/undodir"
set.undofile = true
set.incsearch = true
set.termguicolors = true
set.scrolloff = 8
set.showmode = false
set.completeopt = "menuone,noinsert,noselect"
set.cmdheight = 1
set.updatetime = 50
set.shortmess = "c"

-- commands
vim.cmd([[ autocmd BufEnter * lcd %:p:h ]]) -- autochdir alternative that shouldn't conflict with plugins
vim.cmd([[ autocmd BufWritePre * :%s/\s\+$//e ]]) -- strip trailing whitespace on save

-- colorscheme
vim.o.background = "dark" -- or "light" for light mode
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_invert_selection = "0"
vim.cmd("colorscheme gruvbox")
