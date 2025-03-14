local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		json = { "prettier" },
		python = { "ruff" },
		cpp = { "clang-format" },
		rust = { "rust-fmt" },
	},

	-- format_on_save = {
	-- 	-- These options will be passed to conform.format()
	-- 	timeout_ms = 500,
	-- 	lsp_fallback = true,
	-- },
}

return options
