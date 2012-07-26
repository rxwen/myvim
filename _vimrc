set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

"initialize pathogen plugin
call pathogen#infect()

:set grepprg=grep\ -nrIE
nnoremap \gp :grep 

nnoremap \cn :cnext<CR> 
nnoremap \cp :cprevious<CR> 
nnoremap <C-W>t :tabnew<CR> 
" yank current file name to unamed register
nnoremap \fp :let @"=expand("%:p")<CR> 
nnoremap \fn :let @"=expand("%:t")<CR> 
nnoremap \fd :let @"=expand("%:p:h")<CR> 
" yank current file name to clipboard 
nnoremap \fP :let @*=expand("%:p")<CR> 
nnoremap \fN :let @*=expand("%:t")<CR> 
nnoremap \fD :let @*=expand("%:p:h")<CR> 
" tcsh-style editing keys
:cnoremap <C-A> <Home>
:cnoremap <C-F> <Right>
:cnoremap <C-B> <Left>

syntax on
set nocompatible
let g:html_use_css = 0
set nu
colo darkblue
set nobackup
set ic 	"ignore case when search, to turn it off, run :set noic
set smartindent
set autoindent
set guioptions-=T 
set guioptions-=b " remove scrollbars from gui
set guioptions-=B " remove scrollbars from gui
set guioptions-=l " remove scrollbars from gui
set guioptions-=L " remove scrollbars from gui
set guioptions-=r " remove scrollbars from gui
set guioptions-=R " remove scrollbars from gui
"autocmd FileType c,cpp,h,asp,html set shiftwidth=4 | set tabstop=4 | set expandtab  
set shiftwidth=4 " set auto indent width to 4 when switch lines
set tabstop=4 " set indent width to 4
set expandtab " use spaces instead of tab 
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
"nmap \fd :FufDir<CR>
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

" map F8 to run make command
nnoremap <F8> :make<CR>

nnoremap \p< o#include  <>i
nnoremap \p" o#include  ""i

" Alt-Space is System menu
if has("gui")
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>

  set guifont=Consolas:h11 " set font to Consolas, height 11
endif

"clang-complete options
"let g:clang_exec = "e:\\clang\\clang.exe"
"let g:clang_user_options = '2> NUL || exit 0"'
let g:clang_complete_auto = 0
let g:clang_close_preview = 1
let g:clang_use_library = 1
"let g:clang_snippets = 1 " don't add parameters when complete a kword
let g:clang_auto_select = 1
"set completeopt=menu,longest
"let g:clang_hl_errors = 0
let g:clang_library_path = 'e:\\clang\\'

" nerdtree options
nnoremap \nt    :NERDTreeFocus<CR>
nnoremap \nT    :NERDTree 
nnoremap \nf    :NERDTreeFind<CR>

" snipMate options
let g:snippets_dir = "$VIM/vimfiles/snippets"
let g:snips_email = "rx.wen218@gmail.com"
let g:snips_author = "Raymond Wen"

" finder utility
nnoremap \fi :Find 
