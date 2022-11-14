HOME = os.getenv("HOME")

local g = vim.g -- let
local opt = vim.opt -- set
local cmd = vim.cmd
-- g.color = "dracula"
g.mapleader = " "
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
g.NERDTreeShowHidden = true

g.vscode_style = "dark"
cmd("colorscheme vscode")

-- open automatically when vim starts up on opening a directory
cmd("autocmd StdinReadPre * let s:std_in=1")
cmd(
	'autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe "NERDTree" argv()[0] | wincmd p | ene | endif'
)

-- Airline
g["airline#extensions#tabline#enabled"] = 1
g["airline#extensions#tabline#left_sep"] = ""
g["airline#extensions#tabline#left_alt_sep"] = ""
g["airline#extensions#tabline#right_sep"] = ""
g["airline#extensions#tabline#right_alt_sep"] = ""
g["airline#extensions#tabline#fnamemod"] = ":t"
g.airline_powerline_fonts = true
-- g.airline_left_sep = " ❤  "
-- g.airline_right_sep = " 🟆 "
g.airline_section_y = ""
g.airline_section_x = ""
g.laststatus = 2
opt.showtabline = 2
opt.showmode = false

-- nvim-ufo
-- opt.foldlevelstart = -1
vim.o.foldcolumn = "3" -- '0' is not bad
-- vim.o.foldlevel= 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 5
vim.o.foldenable = true

-- Remove trailing whitespace on save
cmd([[autocmd BufWritePre * %s/s+$//e]])

-- Autoformat using lsp
cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])

-- opt.listchars = "tab:>~,trail:."
-- opt.list = true
