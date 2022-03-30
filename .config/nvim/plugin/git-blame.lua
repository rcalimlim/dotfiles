-- f-person/git-blame.nvim config
vim.g.gitblame_enabled = 0
vim.g.gitblame_date_format = "%Y-%b-%d %X"
vim.g.gitblame_message_template = "<author> • <date>"

local options = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>gbt", ":GitBlameToggle<cr>", options) -- toggle git blame display
vim.api.nvim_set_keymap("n", "<leader>gbo", ":GitBlameOpenCommitURL<cr>", options) -- open git blame url
