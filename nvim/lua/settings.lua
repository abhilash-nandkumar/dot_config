HOME = os.getenv("HOME")

vim.g.mapleader = " "

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.scrolloff = 50
vim.opt.exrc = true
vim.opt.guicursor = ''
vim.opt.signcolumn = 'yes'
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.hidden = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = HOME .. '/.vim/undo-dir'
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.vscode_style = "dark"
vim.cmd('colorscheme vscode')

-- open automatically when vim starts up on opening a directory
vim.cmd('autocmd StdinReadPre * let s:std_in=1')
vim.cmd('autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe "NERDTree" argv()[0] | wincmd p | ene | endif')