-- automatically source this plugin file when it's updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- add bootstrapping portability (download packer if it doesn't exist on current system)
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- instruct packer to load and manage the listed plugins
return require('packer').startup(function(use)
  -- package management (this)
  use 'wbthomason/packer.nvim' -- packer plugin manager (managing itself)

  -- performance benchmarking
  use 'tweekmonster/startuptime.vim' -- measures nvim startup times w/ breakdown

  -- language server protocol
  use 'neovim/nvim-lspconfig' -- base lsp config for nvim
  use 'williamboman/nvim-lsp-installer' -- lsp server manager

  -- file browser
  use 'justinmk/vim-dirvish' -- dirvish file browser (netrw alternative)

  -- ergonomics
  use "b0o/mapx.nvim" -- makes key mapping in lua easier

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
