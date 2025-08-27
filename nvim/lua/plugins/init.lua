return {
	"nvim-lua/plenary.nvim",

	-- themes, visual
	{ "tomasiser/vim-code-dark", name = "vscode-dark" },
	{ "embark-theme/vim", name = "embark" },
	{ "morhetz/gruvbox", name = "gruvbox" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"echasnovski/mini.indentscope",
		config = function()
			require("mini.indentscope").setup()
		end,
	},

	"echasnovski/mini.surround",
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			return require("configs.lualine")
		end,
	},
	{
		"folke/snacks.nvim",
		lazy = false,
		opts = function()
			return require("configs.snacks")
		end,
	},
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			return require("configs.themes")
		end,
	},

	-- file managing , picker etc
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		opts = function()
			return require("configs.nvimtree")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = "Telescope",
		opts = function()
			return require("configs.telescope")
		end,
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			return require("configs.treesitter")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{
		"stevearc/oil.nvim",
		opts = function()
			return require("configs.oil")
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		dependencies = {
			"echasnovski/mini.icons",
			config = function()
				require("mini.icons").setup({})
			end,
		},
		keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
		cmd = "WhichKey",
		opts = function()
			return {
				delay = 100,
			}
		end,
	},

	-- -- formatting!
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		opts = require("configs.conform"),
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- -- lsp stuff
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
		},
		config = function()
			return require("configs.lsp")
		end,
	},

	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
			"kyazdani42/nvim-web-devicons",
			{ "L3MON4D3/LuaSnip", version = "v2.*" },
		},

		-- use a release tag to download pre-built binaries
		version = "*",
		opts = function()
			return require("configs.completion")
		end,
	},
	"nvim-lua/lsp-status.nvim",

	{
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
		-- opts = function()
		-- 	return require("configs.trouble")
		-- end,
	},
	"tpope/vim-commentary",

	-- Git
	"tpope/vim-fugitive",
	-- "tpope/vim-rhubarb",
	"lewis6991/gitsigns.nvim",
	{
		"lewis6991/gitsigns.nvim",
		event = "User FilePost",
		opts = function()
			return require("configs.gitsigns")
		end,
	},
	-- "airblade/vim-rooter",
	-- "moll/vim-bbye",
	-- "nvim-lua/popup.nvim",
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"ibhagwan/fzf-lua",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"tree-sitter/tree-sitter-html",
		},
		opts = function()
			return require("configs.leetcode")
		end,
	},
	{
		"rmagatti/auto-session",
		lazy = false,
		opts = {
			suppressed_dirs = { "~/", "~/Downloads", "/" },
		},
	},
}
