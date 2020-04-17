set nocompatible
syntax on

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
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" fugitive git attributes
autocmd BufReadPost fugitive://* set bufhidden=delete
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" commentary
autocmd FileType cpp set commentstring=//\ %s
autocmd FileType sh set commentstring=#\ %s

" close hidden buffers
function! DeleteHiddenBuffers()
  let tpbl=[]
  let closed = 0
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    if getbufvar(buf, '&mod') == 0
      silent execute 'bwipeout' buf
      let closed += 1
    endif
  endfor
  echo "Closed ".closed." hidden buffers"
endfunction

" source project specific vimrc
if filereadable(".proj_vimrc")
  so .proj_vimrc
endif

" keep viminfo inside .vim/
set viminfo+=n~/.vim/viminfo
