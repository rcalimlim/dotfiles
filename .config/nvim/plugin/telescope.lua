-- nvim-telescope/telescope.nvim configuration
vim.api.nvim_set_keymap("n", "<leader>ps",
                        "<cmd>lua require(\"telescope.builtin\").grep_string({ search = vim.fn.input(\"grep for > \")})",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>pw",
                        "<cmd>lua require(\"telescope.builtin\").grep_string({ search = vim.fn.expand(\"<cword>\")})<cr>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>pf",
                        "<cmd>lua require(\"telescope.builtin\").find_files({ hidden = true })<cr>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>pb", "<cmd>lua require(\"telescope.builtin\").buffers()<cr>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>ph",
                        "<cmd>lua require(\"telescope.builtin\").help_tags()<cr>",
                        {noremap = true, silent = true})
