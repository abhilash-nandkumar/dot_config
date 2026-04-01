return {
	dependencies = {
		{
			-- `snacks.nvim` integration is recommended, but optional
			---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
			"folke/snacks.nvim",
			optional = true,
			opts = {
				input = {}, -- Enhances `ask()`
				picker = { -- Enhances `select()`
					actions = {
						opencode_send = function(...)
							return require("opencode").snacks_picker_send(...)
						end,
					},
					win = {
						input = {
							keys = {
								["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
							},
						},
					},
				},
			},
		},
	},
	keys = {
		{
			"<C-t>",
			function() require("opencode").select() end,
			{ desc = "Execute opencode action…" },
			mode = { "n", "x" },
		},
		{
			"<leader>oo",
			function() require("opencode").toggle() end,
			{ desc = "Toggle opencode" },
			mode = { "n", "t" },
		},
		{
			"<leader>oa",
			function() require("opencode").ask("@this: ", { submit = true }) end,
			desc = "Ask opencode…",
			mode = "n",
		},
		{
			"<leader>oa",
			function() require("opencode").ask("@this: ", { submit = true }) end,
			desc = "Ask opencode…",
			mode = "v",
		},
	},
	config = function()
		---@type opencode.Opts
		vim.o.autoread = true -- Required for `opts.events.reload`
	end,
}
