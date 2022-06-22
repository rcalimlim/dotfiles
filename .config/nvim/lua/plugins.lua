-- bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
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
	use({ "wbthomason/packer.nvim" }) -- packer plugin manager (managing itself)

	-- general
	use({ "tpope/vim-sensible" }) -- widely-used, basic vim configuration
	use({ "tpope/vim-sleuth" }) -- auto-configure indentation settings
	use({ "tpope/vim-commentary" }) -- easy commenting
	use({ -- gruvbox port in lua for speed
		"ellisonleao/gruvbox.nvim",
		commit = "dc6bae93ded04ac542d429ff5cc87189dde44294",
	})
	use({ "tweekmonster/startuptime.vim" }) -- measures nvim startup times w/ breakdown
	use({ "f-person/git-blame.nvim" }) -- git blame
	use({ "yamatsum/nvim-cursorline" }) -- underlines words under cursor

	-- language server protocol
	use({ "neovim/nvim-lspconfig" }) -- base lsp config for nvim
	use({ "williamboman/nvim-lsp-installer" }) -- lsp installer
	use({ "jose-elias-alvarez/nvim-lsp-ts-utils" }) -- ts-completion and autoimports
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- lsp hook for things like stylua

	-- lsp snippets
	use({ "hrsh7th/cmp-vsnip" })
	use({ "hrsh7th/vim-vsnip" })

	-- rust support
	-- use({ "rust-lang/rust.vim" })
	-- use({
	-- 	"simrat39/rust-tools.nvim",
	-- 	config = [[ require("plugins/rust-tools") ]],
	-- 	requires = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
	-- })

	use({
		-- completion plugin
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim builtin LSP client
			"hrsh7th/cmp-nvim-lua", -- nvim-cmp source for nvim lua
			"hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words.
			"hrsh7th/cmp-path", -- nvim-cmp source for filesystem paths.
			"hrsh7th/cmp-calc", -- nvim-cmp source for math calculation.
			"saadparwaiz1/cmp_luasnip", -- luasnip completion source for nvim-cmp
		},
		config = [[ require('plugins/cmp') ]],
	})

	use({
		-- alpha splash screen
		"goolord/alpha-nvim",
		config = [[ require("plugins/alpha") ]],
	})

	use({
		-- tabline
		"akinsho/bufferline.nvim",
		config = [[ require("plugins/bufferline") ]],
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	use({
		-- statusline
		"nvim-lualine/lualine.nvim",
		config = [[ require("plugins/lualine") ]],
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	use({
		-- prettier for js ecosystem
		"prettier/vim-prettier",
		run = "yarn install --frozen-lockfile --production",
		ft = {
			"css",
			"graphql",
			"html",
			"javascript",
			"json",
			"less",
			"markdown",
			"scss",
			"svelte",
			"typescript",
			"vue",
			"yaml",
		},
		config = [[ require("plugins/prettier") ]],
	})

	use({
		-- fuzzy file lister
		"nvim-telescope/telescope.nvim",
		config = [[ require("plugins/telescope") ]],
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
	})

	use({
		-- preview window
		"rmagatti/goto-preview",
		config = [[ require("plugins/goto-preview") ]],
	})

	use({
		-- fn signature
		"ray-x/lsp_signature.nvim", -- show fn signature
		config = [[ require("plugins/lsp_signature") ]],
	})

	use({
		-- displays indent context
		"lukas-reineke/indent-blankline.nvim",
		config = [[ require("plugins/indent-blankline") ]],
	})

	use({
		-- distraction-free mode
		"folke/zen-mode.nvim",
		config = [[ require("plugins/zen-mode") ]],
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if Packer_Bootstrap then
		require("packer").sync()
	end
end)
