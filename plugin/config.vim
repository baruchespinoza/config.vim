let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set re = 1
set termguicolors
" set cursorline
set ttyfast
set relativenumber
set number
set lazyredraw
set mouse=a
set ttimeoutlen=50
set encoding=utf-8
set clipboard=unnamedplus
set wildmode=list:longest
set fileformats=unix,dos,mac
set listchars=tab:▒░,trail:☯
set completeopt=menuone,longest,preview
set tabstop=8 softtabstop=0 expandtab shiftwidth=4
set list showmatch showmode shiftround ttimeout hidden showcmd hlsearch smartcase nobackup nowritebackup noswapfile

nnoremap <Leader>p :set paste<CR>
nnoremap <script> <silent> <unique> <Leader>a :BufExplorerHorizontalSplit<CR>

au BufReadPost *.ctp set syntax=php

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
