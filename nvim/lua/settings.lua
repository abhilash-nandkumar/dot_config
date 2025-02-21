HOME = os.getenv("HOME")

local g = vim.g -- let
local opt = vim.opt -- set
local cmd = vim.cmd
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.tabstop = 4
opt.softtabstop = 4
opt.scrolloff = 50
opt.exrc = true
opt.guicursor = ""
opt.signcolumn = "yes"
opt.relativenumber = true
opt.wrap = false
opt.number = true
opt.hidden = true
opt.smartcase = true
opt.ignorecase = true
opt.swapfile = false
opt.backup = false
opt.undodir = HOME .. "/.vim/undo-dir"
opt.undofile = true
opt.incsearch = true
opt.hlsearch = true
opt.wrapscan = true
opt.splitbelow = true
opt.splitright = true

-- set theme
cmd('colorscheme codedark')

-- open automatically when vim starts up on opening a directory
cmd("autocmd StdinReadPre * let s:std_in=1")

-- nvim-ufo
-- opt.foldlevelstart = -1
vim.o.foldcolumn = "3" -- '0' is not bad
-- vim.o.foldlevel= 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 5
vim.o.foldenable = true

-- Remove trailing whitespace on save
cmd([[autocmd BufWritePre * %s/s+$//e]])

-- Autoformat using lsp
-- cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])

-- opt.listchars = "tab:>~,trail:."
-- opt.list = true
