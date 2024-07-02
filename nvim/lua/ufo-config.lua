local ftMap = {
	vim = "indent",
	python = { "indent" },
	git = "",
}
require("ufo").setup({
	open_fold_hl_timeout = 150,
	close_fold_kinds_for_ft = { "imports", "comment" },
	preview = {
		win_config = {
			border = { "", "─", "", "", "", "─", "", "" },
			winhighlight = "Normal:Folded",
			winblend = 0,
		},
		mappings = {
			scrollU = "<C-u>",
			scrollD = "<C-d>",
		},
	},
	provider_selector = function(bufnr, filetype, buftype)
		return ftMap[filetype]
	end,
})
