"set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

" Alt-Space is System menu
if has("gui")
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>

  set guifont=Consolas:h11 " set font to Consolas, height 11
endif

" initialize pathogen plugin
call pathogen#infect()

:set grepprg=grep\ -nrIE
nnoremap \gp :grep 

nnoremap <C-W>t :tabnew<CR> 
nnoremap \cn :cnext<CR> 
nnoremap \cp :cprevious<CR> 
" yank current file name to unamed register
nnoremap \fp :let @"=expand("%:p")<CR> 
nnoremap \fn :let @"=expand("%:t")<CR> 
" yank current file name to clipboard 
nnoremap \fP :let @*=expand("%:p")<CR> 
nnoremap \fN :let @*=expand("%:t")<CR> 
" tcsh-style editing keys
:cnoremap <C-A> <Home>
:cnoremap <C-F> <Right>
:cnoremap <C-B> <Left>

syntax on
set nocompatible
let g:html_use_css = 0
set nu
set ic
colo darkblue
set nobackup
set smartindent
set autoindent
"autocmd FileType c,cpp,h,asp,html set shiftwidth=4 | set tabstop=4 | set expandtab  
set guioptions-=T " hide toolbar
set shiftwidth=4 " set auto indent width to 4 when switch lines
set tabstop=4 " set indent width to 4
set expandtab " use spaces instead of tab 
set guioptions-=b " remove scrollbars from gui
set guioptions-=B " remove scrollbars from gui
set guioptions-=l " remove scrollbars from gui
set guioptions-=L " remove scrollbars from gui
set guioptions-=r " remove scrollbars from gui
set guioptions-=R " remove scrollbars from gui
set encoding=utf8 " use utf8 encoding by default

au GUIEnter * simalt ~x " start gvim in maximazed mode

autocmd BufNewFile makefile 0r $VIMRUNTIME/../vimfiles/skeleton/makefile.skel
autocmd BufNewFile Android.mk 0r $VIMRUNTIME/../vimfiles/skeleton/Android.mk.skel
autocmd BufNewFile *.tex    0r $VIMRUNTIME/../vimfiles/skeleton/tex.skel
autocmd BufNewFile *.py     0r $VIMRUNTIME/../vimfiles/skeleton/py.skel
autocmd BufNewFile *.pyw     0r $VIMRUNTIME/../vimfiles/skeleton/py.skel

" start fuzzyfinder mapping 
nmap \ff :FufFile<CR>
nmap \fb :FufBuffer<CR>
nmap \fd :FufDir<CR>
nmap \fma :FufBookmarkFileAdd<CR>
nmap \fmf :FufBookmarkFile<CR>
nmap \fmd :FufBookmarkDir<CR>
"nmap \fc :FufMruCmd<CR>
nmap \ft :FufTag<CR>
nmap \fj :FufJumpList<CR>
nmap \fq :FufQuickfix<CR>
nmap \fl :FufLine<CR>
nmap \fh :FufHelp<CR>
"let g:fuf_keyOpenTabpage = '<C-CR>'
let g:fuf_maxMenuWidth = 160
" end fuzzyfind mapping

" doxygentoolkit mapping
nmap \dx :Dox<CR>
" end doxygentoolkit mapping

" windows specific pydoc setting
let g:pydoc_cmd = 'python -m pydoc'
nmap \pD :Pydoc 
nmap \pd :Pydoc <C-R>=expand("<cword>")<CR><CR>
" nmap \ps :PydocSearch  

" generate errorformat(%f:%l: %m) string based on current cursor position
nnoremap \qp :let @"=expand("%").":".line(".").": ".expand("<cWORD>")."\n"<CR>
" reload errorfile
nnoremap \qr :cg .stack<CR>
nnoremap \qv :vsplit .stack<CR> 

" git command
nnoremap \gs :Gstatus<CR>
nnoremap \gl :Glog<CR>
nnoremap \gb :Gblame<CR>
nnoremap \gd :Gdiff<CR>

nnoremap \p< o#include  <>i
nnoremap \p" o#include  ""i
