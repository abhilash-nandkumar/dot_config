vim.cmd("noremap <C-b> :noh<cr>:call clearmatches()<cr>") -- clear matches Ctrl+b

local map = vim.api.nvim_set_keymap
-- local map = vim.keymap.set

function nnoremap(shortcut, command, desc)
	desc = desc or ""
	map("n", shortcut, command, { noremap = true , desc = desc})
end

function nmap(shortcut, command, desc)
	desc = desc or ""
	map("n", shortcut, command, {desc = desc})
end

-- source
nnoremap("<leader>sv", ":source $MYVIMRC<cr>", "Source configs")


-- general Navigation
nnoremap("ü", "{") -- goto previous blank space in vertical direction
nnoremap("+", "}") -- goto next blank space in vertical direction

-- Telescope settings
nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", "Telescope find file")
nnoremap("<leader>fs", "<cmd>Telescope live_grep hidden=true<cr>", "Telescope live grep")
nnoremap("<leader>fd", "<cmd>Telescope grep_string hidden=true<cr>", "Telescope find string")
nnoremap("<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Telescope find in current buffer")
nnoremap("<leader>rs", "<cmd>Telescope resume<cr>", "Telescope resume search")
nnoremap("<leader>bf", "<cmd>Telescope buffers<cr>", "Telescope current open buffers")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>", "Telescope help page")
nnoremap("<leader>sh", "<cmd>Telescope search_history<cr>", "Telescope find string")


-- Git
nnoremap("<leader>gb", "<cmd>Telescope git_branches<cr>", "Git open branch")
nnoremap("<leader>gc", "<cmd>Telescope git_commits<cr>", "Git open commits")
nnoremap("<leader>gbc", "<cmd>Telescope git_bcommits<cr>", "Git file commits")

nnoremap("<leader>gs", ":vertical G<cr>", "Git show status")
nnoremap("<leader>gf", ":diffget //2 <CR>", "Git merge select left")
nnoremap("<leader>gh", ":diffget //3 <CR>", "Git merge select right")

-- search
nnoremap("´", "*") -- goto next search result with + and previous with #
nnoremap("<leader>hl", ":set hlsearch!<CR>", "Toggle search highlighting")
nnoremap("<leader>ch", "<cmd>WhichKey <CR>", "Cheatsheet")
nnoremap("<leader>wk", "<cmd>lua vim.cmd('WhichKey ' .. vim.fn.input 'WhichKey: ')<cr>", "Cheatsheet lookup")


-- Tagbar
nmap("<leader>8", ":TagbarToggle<CR>")

-- Startify Home Page
nmap("<leader>1", ":Startify<CR>", "Go to Homepage")

-- NvimTree
nnoremap("<leader>5", ": NvimTreeToggle<CR>", "Toggle File Tree" )
nnoremap("-", "<cmd>Oil<CR>", "Oil parent directory" )


-- moving text
nnoremap("Y", "y$") -- nnoremap Y y$
nnoremap("<leader>j", ":m .+1<CR>==")
nnoremap("<leader>k", ":m .-2<CR>==")

-- Split Navigation
nnoremap("<C-j>", "<C-W><C-J>", "Window down [v]")
nnoremap("<C-k>", "<C-W><C-K>", "Window up [^]")
nnoremap("<C-l>", "<C-W><C-L>", "Window right [>]")
nnoremap("<C-h>", "<C-W><C-H>", "Window left [<]")

nnoremap("<A-v>", ":vsplit<CR>", "Split open vertical")
nnoremap("<A-b>", ":split<CR>", "Split open horizontal")

-- Go to tab by number
nnoremap("<Tab>", ":bnext<CR>", "Buffer next")
nnoremap("<S-Tab>", ":bprev<CR>", "Buffer prev")
nnoremap("4", ":bd<CR>", "Buffer close")

-- floaterm
vim.g.floaterm_keymap_toggle = "<leader>t"
vim.g.floaterm_keymap_new = "<leader>ft"

-- vim-sneak
map("", "gS", "<Plug>Sneak_", { silent = true })
map("", "gs", "<Plug>Sneak_", { silent = true })

-- Replace string
map("n", "S", ":%s///gI<Left><Left><Left><Left>", { noremap = true })
map("v", "S", ":s//<Left>", { noremap = true })

-- Alias write and quit to Q
nnoremap("<leader>q", ":wq<CR>")
nnoremap("<leader>w", ":w<CR>")

-- nvim-ufo for Folding
nnoremap("zR", "<cmd>lua require('ufo').openAllFolds()<CR>", "Fold open")
nnoremap("zM", "<cmd>lua require('ufo').closeAllFolds()<CR>", "Fold close")
nnoremap("zr", "<cmd>lua require('ufo').openFoldsExceptKinds()<CR>")
nnoremap("zm", "<cmd>lua require('ufo').closeFoldsWith()<CR>") -- closeAllFolds == closeFoldsWith(0)
vim.keymap.set("n", "K", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end)

-- trouble.nvim
nnoremap("<leader>xx", "<cmd>Trouble<cr>")
nnoremap("<leader>xd", "<cmd>Trouble diagnostics<cr>")
nnoremap("<leader>xl", "<cmd>Trouble loclist<cr>")
nnoremap("<leader>xq", "<cmd>Trouble quickfix<cr>")
nnoremap("R", "<cmd>Trouble lsp_references<cr>")
