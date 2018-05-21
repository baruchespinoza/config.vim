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
set list showmatch showmode shiftround ttimeout hidden showcmd relativenumber number hlsearch smartcase nobackup nowritebackup noswapfile termguicolors

au BufReadPost *.ctp set syntax=php

nnoremap <Leader>p :set paste<CR>

nnoremap <C-t> :enew<CR>
nnoremap <C-n> :bnext<CR>
nnoremap <C-b> :bprev<CR>

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
