vim.cmd("noremap <C-b> :noh<cr>:call clearmatches()<cr>") -- clear matches Ctrl+b

local map = vim.api.nvim_set_keymap

options = { noremap = true, silent = true }

function nnoremap(shortcut, command)
	map("n", shortcut, command, { noremap = true })
end

function nmap(shortcut, command)
	map("n", shortcut, command, {})
end

function imap(shortcut, command)
	map("i", shortcut, command, {})
end

function vmap(shortcut, command)
	map("v", shortcut, command, {})
end

function cmap(shortcut, command)
	map("c", shortcut, command, {})
end

function tmap(shortcut, command)
	map("t", shortcut, command, {})
end

-- general Navigation
nnoremap("ü", "{") -- goto previous blank space in vertical direction
nnoremap("+", "}") -- goto next blank space in vertical direction

-- Telescope settings
nnoremap("<leader>ff", "<cmd>Telescope find_files hidden=true<cr>") -- nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap("<leader>fs", "<cmd>Telescope live_grep hidden=true<cr>") -- nnoremap <leader>fs <cmd>Telescope live_grep<cr>
nnoremap("<leader>fd", "<cmd>Telescope grep_string hidden=true<cr>") -- nnoremap <leader>fs <cmd>Telescope live_grep<cr>
nnoremap("<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>") -- nnoremap <leader>fs <cmd>Telescope live_grep<cr>
nnoremap("<leader>r", "<cmd>Telescope resume<cr>") -- nnoremap <leader>fs <cmd>Telescope live_grep<cr>
nnoremap("<leader>bf", "<cmd>Telescope buffers<cr>") -- nnoremap  <leader>fb <cmd>Telescope buffers<cr>
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>") -- nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap("<leader>sh", "<cmd>Telescope search_history<cr>") -- nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap("<leader>dr", "<cmd>lua require('telescope').extensions.ros.packages{cwd=os.getenv('WSDIR') or '.'}<CR>")
-- nnoremap("<leader>ff", "<cmd>lua require('telescope').extensions.ros.files{}<CR>")
-- nnoremap("<leader>fs", "<cmd>lua require('telescope').extensions.ros.live_grep{}<CR>")
-- nnoremap("<leader>fd", "<cmd>lua require('telescope').extensions.ros.grep_string{}<CR>")

-- Git
nnoremap("<leader>gb", "<cmd>Telescope git_branches<cr>") -- open list of branches
nnoremap("<leader>gc", "<cmd>Telescope git_commits<cr>") -- open list of commit
nnoremap("<leader>gbc", "<cmd>Telescope git_bcommits<cr>") -- nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap("<leader>gs", ":G<cr>") -- Show git status
nnoremap("<leader>gf", ":diffget //2 <CR>") -- select left during merge conflicts
nnoremap("<leader>gh", ":diffget //3 <CR>") -- select right during merge conflicts

-- search
nnoremap("´", "*") -- goto next search result with + and previous with #
nnoremap("<leader>hl", ":set hlsearch!<CR>") -- toggle highlight search

-- Tagbar
nmap("<F8>", ":TagbarToggle<CR>") -- nmap <F8> :TagbarToggle<CR>

-- Startify Home Page
nmap("<F1>", ":Startify<CR>")

-- NERDTree
map("", "<F5>", ": NERDTreeToggle<CR>", { silent = true }) -- map <silent> <F5> : NERDTreeToggle<CR>

-- moving text
nnoremap("Y", "y$") -- nnoremap Y y$
nnoremap("<leader>j", ":m .+1<CR>==") -- nnoremap <leader>j :m .+1<CR>==
nnoremap("<leader>k", ":m .-2<CR>==") -- nnoremap <leader>k :m .-2<CR>==

-- Split Navigation
nnoremap("<C-j>", "<C-W><C-J>") -- nnoremap <C-J> <C-W><C-J>
nnoremap("<C-k>", "<C-W><C-K>") -- nnoremap <C-K> <C-W><C-K>
nnoremap("<C-l>", "<C-W><C-L>") -- nnoremap <C-L> <C-W><C-L>
nnoremap("<C-h>", "<C-W><C-H>") -- nnoremap <C-H> <C-W><C-H>

nnoremap("<A-v>", ":vsplit<CR>")
nnoremap("<A-b>", ":split<CR>")

-- Go to tab by number
nnoremap("<Tab>", ":bnext<CR>")
nnoremap("<S-Tab>", ":bprev<CR>")
nnoremap("<leader><F4>", ":bd<CR>")

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
nnoremap("zR", "<cmd>lua require('ufo').openAllFolds()<CR>")
nnoremap("zM", "<cmd>lua require('ufo').closeAllFolds()<CR>")
nnoremap("zr", "<cmd>lua require('ufo').openFoldsExceptKinds()<CR>")
nnoremap("zm", "<cmd>lua require('ufo').closeFoldsWith()<CR>") -- closeAllFolds == closeFoldsWith(0)
vim.keymap.set("n", "K", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end)
