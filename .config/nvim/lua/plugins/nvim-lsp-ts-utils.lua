-- jose-elias-alvarez/nvim-lsp-ts-utils config
vim.api.nvim_set_keymap("n", "<Leader>lio", ":TSLspOrganize<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>lrn", ":TSLspRenameFile<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ll", ":TSLspImportAll<CR>", { noremap = true, silent = true })
