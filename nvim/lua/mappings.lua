vim.cmd("noremap <C-b> :noh<cr>:call clearmatches()<cr>") -- clear matches Ctrl+b

local map = vim.api.nvim_set_keymap
-- local map = vim.keymap.set

function nnoremap(shortcut, command, desc)
	desc = desc or ""
	map("n", shortcut, command, { noremap = true, desc = desc })
end

function nmap(shortcut, command, desc)
	desc = desc or ""
	map("n", shortcut, command, { desc = desc })
end

-- source
nnoremap("<leader>sv", ":source $MYVIMRC<cr>", "Source configs")

nnoremap("<leader>th", "<cmd>Themery<cr>", "Theme")

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

nnoremap("<leader>f", "<cmd>lua require('conform').format { lsp_fallback = true }<cr>", "Format file")

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

-- NvimTree
nnoremap("<leader>5", ": NvimTreeToggle<CR>", "Toggle File Tree")
nnoremap("-", "<cmd>Oil<CR>", "Oil parent directory")

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

-- Replace string
map("n", "R", ":%s///gI<Left><Left><Left><Left>", { noremap = true })
map("v", "R", ":s//<Left>", { noremap = true })

-- Alias write and quit to Q
nnoremap("<leader>q", ":wq<CR>")
nnoremap("<leader>w", ":w<CR>")

-- trouble.nvim
nnoremap("<leader>xx", "<cmd>Trouble<cr>", "Trouble")
nnoremap("<leader>xd", "<cmd>Trouble diagnostics<cr>", "Diagnostics")
nnoremap("<leader>xl", "<cmd>Trouble loclist<cr>", "Loclist")
nnoremap("<leader>xq", "<cmd>Trouble quickfix<cr>", "Quickfix list")
-- nnoremap("R", "<cmd>Trouble lsp_references<cr>")

-- LSP
nnoremap("<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", "LSP Go to declaration")
nnoremap("<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", "LSP Go to definition")
nnoremap("<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", "LSP Go to implementation")
nnoremap("<leader>h", "<cmd>lua vim.lsp.buf.hover()<cr>", "LSP Hover")
nnoremap("<leader>fx", "<cmd>lua vim.lsp.buf.code_action()<cr>", "LSP Code action")
nnoremap("<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", "LSP Rename")

--   map("n", "<leader>wl", function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, opts "List workspace folders")

--   map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

--   map("n", "gr", vim.lsp.buf.references, opts "Show references")
