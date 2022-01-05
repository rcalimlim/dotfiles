-- find and search config

-- search for highlighted text with //
vim.api.nvim_exec(
[[
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
]],
false)
