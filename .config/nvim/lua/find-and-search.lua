-- find and search config
-- search for highlighted text with //
vim.api.nvim_exec( -- using nvim_exec bc I can't figure out how to format the second expr
[[
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
]], false)
