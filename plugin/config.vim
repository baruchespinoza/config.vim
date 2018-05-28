let mapleader = ','
" let maplocalleader = ","
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set mouse=a
set ttimeoutlen=50
set encoding=utf-8
set clipboard=unnamedplus
set wildmode=list:longest
set fileformats=unix,dos,mac
set listchars=tab:▒░,trail:☯
set completeopt=menuone,longest,preview
set tabstop=8 softtabstop=0 expandtab shiftwidth=4
set list showmatch showmode shiftround ttimeout hidden showcmd relativenumber number hlsearch smartcase nobackup nowritebackup noswapfile termguicolors cursorline

nnoremap <Leader>p :set paste<CR>
nnoremap <script> <silent> <unique> <Leader>a :BufExplorerHorizontalSplit<CR>

au BufReadPost *.ctp set syntax=php
