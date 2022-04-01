-- automatically source this plugin file when it's updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- add bootstrapping portability (download packer if it doesn't exist on current system)
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	Packer_Bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

-- instruct packer to load and manage the listed plugins
return require("packer").startup(function(use)
	-- package management (this)
	use("wbthomason/packer.nvim") -- packer plugin manager (managing itself)

	-- colorscheme
	use({ "ellisonleao/gruvbox.nvim" }) -- gruvbox port in lua for speed

	-- performance benchmarking
	use("tweekmonster/startuptime.vim") -- measures nvim startup times w/ breakdown

	-- language server protocol
	use("neovim/nvim-lspconfig") -- base lsp config for nvim
	use("jose-elias-alvarez/nvim-lsp-ts-utils") -- ts-completion and autoimports
	use("mfussenegger/nvim-jdtls") -- java
	use("williamboman/nvim-lsp-installer") -- lsp installer
	use("jose-elias-alvarez/null-ls.nvim") -- lsp hook for things like stylua

	-- lsp autocompletion
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp") -- autocompletion

	-- lsp snippets
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip") -- snippets

	-- lsp formatting
	use({ -- prettier for js ecosystem
		"prettier/vim-prettier",
		run = "yarn install --frozen-lockfile --production",
		ft = {
			"javascript",
			"typescript",
			"css",
			"less",
			"scss",
			"json",
			"graphql",
			"markdown",
			"vue",
			"svelte",
			"yaml",
			"html",
		},
	})
	use("fladson/vim-kitty") -- kitty formatting
	use({ "rust-lang/rust.vim" })
	use({
		"simrat39/rust-tools.nvim",
		config = require("rust-tools").setup({}),
		requires = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
	})

	-- lsp utils
	use({
		"ray-x/lsp_signature.nvim", -- show fn signature
		config = require("lsp_signature").setup({ max_width = 85 }),
	})

	-- fuzzy file lister
	use({ -- file list traverser
		"nvim-telescope/telescope.nvim",
		config = require("telescope").setup({
			defaults = {
				file_ignore_patterns = { ".git/*" },
				layout_strategy = "horizontal",
				layout_config = { height = 0.95, width = 0.95 },
			},
		}),
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- file browser
	use("justinmk/vim-dirvish") -- dirvish file browser (netrw alternative)

	-- preview window
	use({ "rmagatti/goto-preview", config = require("goto-preview").setup({}) })

	-- buffers as tabs
	vim.opt.termguicolors = true
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = require("bufferline").setup({
			options = { show_buffer_close_icons = false, show_close_icons = false },
		}),
	})

	-- statusline
	use({
		"nvim-lualine/lualine.nvim",
		config = require("lualine").setup({}),
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	}) -- bottom of nvim info line

	-- cursor
	use({ "yamatsum/nvim-cursorline" }) -- underlines words under cursor

	-- indents
	vim.opt.list = true
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({ filetype_exclude = { "alpha", "lua" } })
		end,
	}) -- displays indent context

	-- git
	use({ "f-person/git-blame.nvim" }) -- shows git blame

	-- greeter
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- general
	use("tpope/vim-sensible") -- widely-used, basic vim configuration
	use("tpope/vim-sleuth") -- auto-configure indentation settings
	use("tpope/vim-commentary") -- easy commenting

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if Packer_Bootstrap then
		require("packer").sync()
	end
end)
