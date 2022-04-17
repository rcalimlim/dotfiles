-- keymaps
local map = require("utils").map

vim.g.mapleader = " "

-- alpha
map("n", "<leader>al", ":Alpha<cr>")

-- buffer manipulation
map("n", "<leader>w", "<C-w>") -- cycle window focus
map("n", "<leader>bd", ":bd<cr>") -- delete current buffer
map("n", "<leader>bn", ":bn<cr>") -- goto next buffer
map("n", "<leader>bp", ":bp<cr>") -- goto previous buffer
map("n", "<leader>bad", ":%bd<cr>") -- delete all buffers

-- git-blame
map("n", "<leader>gbt", ":GitBlameToggle<cr>") -- toggle git blame display
map("n", "<leader>gbo", ":GitBlameOpenCommitURL<cr>") -- open git blame url

-- goto-preview
map("n", "<leader>pd", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>")
map("n", "<leader>pi", "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>")
map("n", "<leader>pr", "<cmd>lua require('goto-preview').goto_preview_references()<cr>")
map("n", "<leader>P", "<cmd>lua require('goto-preview').close_all_win()<cr>")

-- lsp
map("n", "<leader>vc", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "<leader>vd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "<leader>vt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
map("n", "<leader>vi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "<leader>vh", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "<leader>vsh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<leader>vgr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<leader>ve", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "<leader>vn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "<leader>vp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map("n", "<leader>vf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
map("i", "<expr> <Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"')
map("i", "<expr> <S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"')

-- telescope
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
map("n", "<leader>fs", "<cmd>lua require('telescope.builtin').grep_string()<cr>")
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
map("n", "-", ":Telescope file_browser<cr>")

-- zen-mode
map("n", "<leader>ll", ":ZenMode<cr>")

-- misc
vim.cmd([[ vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR> ]]) -- search highlighted text with //
