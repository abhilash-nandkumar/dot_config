local telescope = require("telescope")

telescope.setup({
	pickers = {
		live_grep = {
			additional_args = function(opts)
				return { "--hidden" }
			end,
		},
	},
})
