set tabstop=4
set softtabstop=4
set scrolloff=50
set exrc 
set guicursor=
set signcolumn=yes
set relativenumber
set nowrap
set number
set hidden
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undo-dir
set undofile
set incsearch

call plug#begin()
" Themes
Plug 'tomasiser/vim-code-dark'
Plug 'Mofiqul/vscode.nvim'

" Grep and Filesearch
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" Autocomplete and formating
Plug 'Valloric/YouCompleteMe'
Plug 'psf/black'

" Tree
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'kyazdani42/nvim-web-devicons'

" Git
Plug 'tpope/vim-fugitive'
call plug#end()

" Theme
let g:vscode_style = "dark"
colorscheme vscode

" Telescope settings
let mapleader = " "
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fs <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ycm
let g:ycm_global_ycm_extra_conf = '~/.local/share/nvim/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python'
let g:ycm_complete_in_comments = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers =  {
  \ 'c' : ['re!\w{2}'],
  \ 'cpp' : ['re!\w{2}'],
  \ 'python' : ['re!\w{2}'],
  \ }

" autoformat
augroup autoformat_settings
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType python AutoFormatBuffer black
augroup END

" NERDTree
map <silent> <F5> : NERDTreeToggle<CR>
" open automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Tagbar
nmap <F8> :TagbarToggle<CR>

" moving text
nnoremap Y y$
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Jump to beginning and end of line
nnoremap <leader>3 ^
nnoremap <leader>4 $

" Split Navigation
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
