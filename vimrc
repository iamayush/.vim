set nocompatible

" show status line always
set laststatus=2

" allow hidden buffers
set hidden

" indentation preferences
set tabstop=2 shiftwidth=2 expandtab
set autoindent

" line numbers
set number
set relativenumber

" search attributes
set hlsearch
set incsearch
set ignorecase

" directory tree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 18

" CtrlP attributes
let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1

" fugitive git attributes
autocmd BufReadPost fugitive://* set bufhidden=delete
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" keep viminfo inside .vim/
set viminfo+=n~/.vim/viminfo
