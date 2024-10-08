return require("packer").startup(function()
	use({ "wbthomason/packer.nvim" })

	-- Packer can manage itself
	use("tomasiser/vim-code-dark")

	-- Themes
	use("Mofiqul/vscode.nvim")

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use("bi0ha2ard/telescope-ros.nvim")

	use("nvim-lua/popup.nvim")

	-- Oil
	use ('nvim-tree/nvim-tree.lua')
	use ('stevearc/oil.nvim')

	-- Git
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use("lewis6991/gitsigns.nvim")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("ray-x/lsp_signature.nvim")

	--Debugging
	use("mfussenegger/nvim-dap")
	use("rcarriga/cmp-dap")
	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-telescope/telescope-dap.nvim")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	-- completion
	use("hrsh7th/nvim-cmp")
	use({
		"hrsh7th/cmp-nvim-lsp",
		branch = "main",
	})
	use({
		"hrsh7th/cmp-path",
		branch = "main",
	})
	use({
		"hrsh7th/cmp-nvim-lua",
		branch = "main",
	})
	use({
		"hrsh7th/cmp-buffer",
		branch = "main",
	})
	-- use("onsails/lspkind.nvim")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	-- misc
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-autopairs")
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})
	use("voldikss/vim-floaterm")
	use("vim-airline/vim-airline")
	use("vim-airline/vim-airline-themes")
	use("mhinz/vim-startify")
	use("airblade/vim-rooter")
	use("tpope/vim-commentary")
	use("moll/vim-bbye")
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
end)
