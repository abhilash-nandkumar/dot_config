vim.cmd('noremap <C-b> :noh<cr>:call clearmatches()<cr>') -- clear matches Ctrl+b

local map = vim.api.nvim_set_keymap

options = {noremap = true, silent = true}

function nnoremap(shortcut, command)
    map('n', shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
    map('n', shortcut, command, {silent = true})
end

function imap(shortcut, command)
    map('i', shortcut, command, {})
end

function vmap(shortcut, command)
    map('v', shortcut, command, {})
end

function cmap(shortcut, command)
    map('c', shortcut, command, {})
end

function tmap(shortcut, command)
    map('t', shortcut, command, {})
end


-- Telescope settings
nnoremap('<leader>ff', '<cmd>Telescope find_files<cr>') -- nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap('<leader>fs', '<cmd>Telescope live_grep<cr>') -- nnoremap <leader>fs <cmd>Telescope live_grep<cr>
nnoremap('<leader>fb', '<cmd>Telescope buffers<cr>') -- nnoremap  <leader>fb <cmd>Telescope buffers<cr>
nnoremap('<leader>fh', '<cmd>Telescope help_tags<cr>') -- nnoremap <leader>fh <cmd>Telescope help_tags<cr>

-- Tagbar
nmap('<F8>', ':TagbarToggle<CR>') -- nmap <F8> :TagbarToggle<CR>

-- NERDTree
map('', '<F5>', ': NERDTreeToggle<CR>', {silent = true }) -- map <silent> <F5> : NERDTreeToggle<CR>

-- moving text
nnoremap('Y', 'y$') -- nnoremap Y y$
nnoremap('<leader>j', ':m .+1<CR>==') -- nnoremap <leader>j :m .+1<CR>==
nnoremap('<leader>k', ':m .-2<CR>==') -- nnoremap <leader>k :m .-2<CR>==

-- Split Navigation
nnoremap('<C-J>', '<C-W><C-J>') -- nnoremap <C-J> <C-W><C-J>
nnoremap('<C-K>', '<C-W><C-K>') -- nnoremap <C-K> <C-W><C-K>
nnoremap('<C-L>', '<C-W><C-L>') -- nnoremap <C-L> <C-W><C-L>
nnoremap('<C-H>', '<C-W><C-H>') -- nnoremap <C-H> <C-W><C-H>

-- Go to tab by number
nnoremap('<leader>1', '1gt')
nnoremap('<leader>2', '2gt')
nnoremap('<leader>3', '3gt')
nnoremap('<leader>4', '4gt')
nnoremap('<leader>5', '5gt')
nnoremap('<leader>6', '6gt')
nnoremap('<leader>7', '7gt')
nnoremap('<leader>8', '8gt')
nnoremap('<leader>9', '9gt')
nnoremap('<leader>0', ':tablast<cr>')


-- floaterm
vim.g.floaterm_keymap_toggle = '<leader>t'
vim.g.floaterm_keymap_new = '<leader>ft'
