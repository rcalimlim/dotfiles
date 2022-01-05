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
  use 'jose-elias-alvarez/nvim-lsp-ts-utils' -- ts-completion and autoimports

  -- lsp autocompletion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp' -- autocompletion

  -- lsp snippets
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip' -- snippets

  -- lsp formatting
  use { -- prettier for ts
    'prettier/vim-prettier',
    run = 'yarn install --frozen-lockfile --production',
  }

  -- tree sitter
  use 'nvim-telescope/telescope.nvim' -- file list traverser


  -- file browser
  use 'justinmk/vim-dirvish' -- dirvish file browser (netrw alternative)

  -- general plugins
  use 'morhetz/gruvbox' -- gruvbox color scheme
  use 'tpope/vim-sensible' -- widely-used, basic vim configuration
  use 'tpope/vim-sleuth' -- auto-configure indentation settings
  use 'tpope/vim-commentary' -- easy commenting

  -- general dependencies
  use 'nvim-lua/plenary.nvim' -- dep
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- dep

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
