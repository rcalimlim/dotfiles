-- remappings
vim.g.mapleader = " " -- set leader to <Space>

-- load everything in /lua folder
require("plugins")
require("autochdir")
require("buffers")
require("find-and-search")
require("lsp-cfg")
require("lsp-cmd")
require("set")
require("whitespace")

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

-- colorscheme
vim.o.background = "dark" -- or "light" for light mode
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_invert_selection = "0"
vim.cmd("colorscheme gruvbox")
