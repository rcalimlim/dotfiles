-- nvim-telescope/telescope.nvim keys
local options = { noremap = true, silent = true }

vim.api.nvim_set_keymap(
	"n",
	"<leader>ff",
	"<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>",
	options
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fs",
	"<cmd>lua require('telescope.builtin').grep_string({hidden=true})<cr>",
	options
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fg",
	"<cmd>lua require('telescope.builtin').live_grep({hidden=true})<cr>",
	options
)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
