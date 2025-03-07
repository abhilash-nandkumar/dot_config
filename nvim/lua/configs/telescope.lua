-- local trouble = require("trouble.providers.telescope")
-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set

function nnoremap(shortcut, command, desc)
	desc = desc or ""
	map("n", shortcut, command, { noremap = true, desc = desc })
end

return {
	defaults = {
		-- mappings = {
		-- 	i = { ["<c-t>"] = trouble.open_with_trouble },
		-- 	n = { ["<c-t>"] = trouble.open_with_trouble },
		-- },
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

	nnoremap("<leader>en", function()
		require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
	end, "Edit nvim configs"),
	nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", "Telescope find file"),
	nnoremap(
		"<leader>fs",
		"<cmd>Telescope live_grep hidden=true {vimgrep_arguments='--fixed-strings'} <cr>",
		"Telescope live grep"
	),
	nnoremap(
		"<leader>fd",
		"<cmd>lua require('telescope.builtin').grep_string{ shorten_path = true, word_match = '-w', only_sort_text = true, search = '' }<cr>",
		"Telescope find string"
	),
	nnoremap("<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Telescope find in current buffer"),
	nnoremap("<leader>rs", "<cmd>Telescope resume<cr>", "Telescope resume search"),
	nnoremap("<leader>bf", "<cmd>Telescope buffers<cr>", "Telescope current open buffers"),
	nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>", "Telescope help page"),
	nnoremap("<leader>sh", "<cmd>Telescope search_history<cr>", "Telescope find string"),
}
