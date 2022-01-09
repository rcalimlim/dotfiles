-- rmagatti/goto-preview config
local options = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<leader>pd", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>pi", "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>pr", "<cmd>lua require('goto-preview').goto_preview_references()<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>P", "<cmd>lua require('goto-preview').close_all_win()<cr>", options)
