vim.cmd("noremap <C-b> :noh<cr>:call clearmatches()<cr>") -- clear matches Ctrl+b

local map = vim.api.nvim_set_keymap

options = { noremap = true, silent = true }

function nnoremap(shortcut, command)
	map("n", shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
	map("n", shortcut, command, { silent = true })
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
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>") -- nnoremap  <leader>fb <cmd>Telescope buffers<cr>
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>") -- nnoremap <leader>fh <cmd>Telescope help_tags<cr>

-- Git
nnoremap("<leader>gb", "<cmd>Telescope git_branches<cr>") -- open list of branches
nnoremap("<leader>gc", "<cmd>Telescope git_commits<cr>") -- open list of commit
nnoremap("<leader>gdd", "<cmd>Telescope git_bcommits<cr>") -- nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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
nnoremap("<A-h>", ":split<CR>")

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
