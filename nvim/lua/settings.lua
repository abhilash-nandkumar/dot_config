HOME = os.getenv("HOME")

local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

g.mapleader = " "
opt.mouse = 'a'
opt.tabstop = 4
opt.softtabstop = 4
opt.scrolloff = 50
opt.exrc = true
opt.guicursor = ''
opt.signcolumn = 'yes'
opt.relativenumber = true
opt.wrap = false
opt.number = true
opt.hidden = true
opt.smartcase = true
opt.ignorecase = true
opt.swapfile = false
opt.backup = false
opt.undodir = HOME .. '/.vim/undo-dir'
opt.undofile = true
opt.incsearch = true
opt.splitbelow = true
opt.splitright = true

g.vscode_style = "dark"
cmd('colorscheme vscode')

-- open automatically when vim starts up on opening a directory
cmd('autocmd StdinReadPre * let s:std_in=1')
cmd('autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe "NERDTree" argv()[0] | wincmd p | ene | endif')

-- Airline
g['airline#extensions#tabline#enabled'] = 1
g['airline#extensions#tabline#left_sep'] = ''
g['airline#extensions#tabline#left_alt_sep'] = ''
g['airline#extensions#tabline#right_sep'] = ''
g['airline#extensions#tabline#right_alt_sep'] = ''
g.airline_powerline_fonts = true
g.airline_left_sep = ''
g.airline_right_sep = ''
opt.showtabline = 2
opt.showmode = false

-- vim-sneak
g['sneak#label'] = 1
g['sneak#use_ic_scs'] = 1
g['sneak#s_next'] = 1
g['sneak#prompt'] = '🔍: '
cmd('highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan')
cmd('highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow')


