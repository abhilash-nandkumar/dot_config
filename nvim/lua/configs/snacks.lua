local map = vim.keymap.set

function nnoremap(shortcut, command, desc)
	desc = desc or ""
	map("n", shortcut, command, { noremap = true, desc = desc })
end

return {
	dashboard = {
		sections = {
			{ section = "header" },
			{
				pane = 2,
				section = "terminal",
				cmd = "colorscript -e 12",
				height = 5,
				padding = 1,
			},
			{ section = "keys", gap = 1, padding = 1 },
			{
				pane = 2,
				icon = " ",
				title = "Recent Files",
				section = "recent_files",
				indent = 2,
				padding = 1,
			},
			{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
			{
				pane = 2,
				icon = " ",
				title = "Git Status",
				section = "terminal",
				enabled = function()
					return Snacks.git.get_root() ~= nil
				end,
				cmd = "git status --short --branch --renames",
				height = 5,
				padding = 1,
				ttl = 5 * 60,
				indent = 3,
			},
			{ section = "startup" },
		},
	},
	dim = { enabled = true },
	layzgit = { enabled = true },
	picker = { enabled = true },
	notifier = { enabled = true },
	toggle = {
		which_key = true, -- integrate with which-key to show enabled/disabled icons and colors
		notify = true, -- show a notification when toggling
		-- icons for enabled/disabled states
		icon = {
			enabled = " ",
			disabled = " ",
		},
		-- colors for enabled/disabled states
		color = {
			enabled = "green",
			disabled = "yellow",
		},
		wk_desc = {
			enabled = "Disable ",
			disabled = "Enable ",
		},
	},

	-- keymaps
	nnoremap("<leader>tg", function()
		Snacks.dim.enable()
	end, "Dim enable"),
	nnoremap("<leader>tG", function()
		Snacks.dim.disable()
	end, "Dim disable"),
	nnoremap("<leader>gl", function()
		Snacks.lazygit()
	end, "Lazy Git"),
}
