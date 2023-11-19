local telescope = require("telescope")

local trouble = require("trouble.providers.telescope")
telescope.setup({
	defaults = {
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
		layout_strategy = "vertical",
		layout_config = { width = 0.95 },
		file_ignore_patterns = { ".git/", ".cache", "%.pdf", "%.rviz" },
	},
	pickers = {
		live_grep = {
			additional_args = function(opts)
				return { "--hidden" }
			end,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = false, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})
telescope.load_extension("dap")
telescope.load_extension("fzf")
telescope.load_extension("ros")
