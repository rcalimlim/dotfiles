-- lsp mappings
local opts = { noremap = true, silent = true }

-- see `:help vim.lsp.*` for documentation on any of the below functions
vim.api.nvim_set_keymap("n", "<leader>vc", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>vd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>vt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>vi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>vh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>vsh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>vgr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ve", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>vn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>vp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>vf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
vim.api.nvim_set_keymap("i", "<expr> <Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"', opts)
vim.api.nvim_set_keymap("i", "<expr> <S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', opts)

-- autoformat efm
vim.cmd("autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)")
