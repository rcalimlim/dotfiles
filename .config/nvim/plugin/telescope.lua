-- nvim-telescope/telescope.nvim configuration
require("telescope").setup {defaults = {layout_strategy = "vertical", layout_config = {height = 0.95, width = 0.85}}}

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fd", "<cmd>lua require('telescope.builtin').file_browser()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>lua require('telescope.builtin').grep_string()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fl", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
