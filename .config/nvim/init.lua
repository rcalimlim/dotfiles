-- remappings
vim.g.mapleader = " " -- set leader to <Space>
vim.api.nvim_set_keymap("n", "<Leader>w", "<C-w>", {noremap = true, silent = true}) -- map <Leader>w to change windows

-- colorscheme
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_invert_selection = "0"
vim.cmd("colorscheme gruvbox")

-- load everything in /lua folder
require("disable-defaults")
require("find-and-search")
require("lsp-cfg")
require("lsp-cmd")
require("plugins")
require("set")
require("whitespace")
