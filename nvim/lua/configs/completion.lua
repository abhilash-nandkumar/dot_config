return {
	-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept, C-n/C-p for up/down)
	-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys for up/down)
	-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
	--
	-- All presets have the following mappings:
	-- C-space: Open menu or open docs if already open
	-- C-e: Hide menu
	-- C-k: Toggle signature help
	keymap = {
		preset = "default",
		["<C-k>"] = { "select_prev", "fallback_to_mappings" },
		["<C-j>"] = { "select_next", "fallback_to_mappings" },
		["<C-l>"] = { "show_signature", "hide_signature", "fallback"},
	},

	appearance = {
		-- Useful for when your theme doesn't support blink.cmp
		-- Will be removed in a future release
		use_nvim_cmp_as_default = true,
		-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},
	signature = { enabled = true },

	snippets = { preset = "luasnip" },

	-- Default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	-- Blink.cmp uses a Rust fuzzy matcher by default for typo resistance and significantly better performance
	-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
	-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
	--
	-- See the fuzzy documentation for more information
	fuzzy = { implementation = "prefer_rust_with_warning" },
}
