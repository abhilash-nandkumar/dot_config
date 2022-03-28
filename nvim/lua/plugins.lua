-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'tomasiser/vim-code-dark'

    -- Themes
    use 'Mofiqul/vscode.nvim'

    -- Grep and Filesearch
    use {
			'nvim-telescope/telescope.nvim',
			requires = {{'nvim-lua/plenary.nvim'}}
	}
    use {
			'nvim-telescope/telescope-fzf-native.nvim',
			run = 'make'
	}
    use 'nvim-lua/popup.nvim'

    -- Tree
    use 'scrooloose/nerdtree'
    use 'majutsushi/tagbar'
    use 'kyazdani42/nvim-web-devicons'

    -- Git
    use 'tpope/vim-fugitive'

    use 'mhinz/vim-startify'
    use 'airblade/vim-rooter'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
	use {
			'hrsh7th/cmp-nvim-lsp',
			branch = 'main'
	}
    use {
			'hrsh7th/cmp-path',
			branch = 'main'
	}
    use {
			'hrsh7th/cmp-nvim-lua',
			branch = 'main'
	}
    use {
			'hrsh7th/cmp-buffer',
			branch = 'main'
	}
    use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
    use 'ray-x/lsp_signature.nvim'
    -- use 'p00f/clangd_extensions.nvim'
    
	use 'psf/black'
    
	use {
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
					require("todo-comments").setup {}
			end
	}
    use 'voldikss/vim-floaterm'
	use 'bi0ha2ard/telescope-ros.nvim'
end)
