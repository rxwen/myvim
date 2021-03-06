set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

"initialize pathogen plugin
call pathogen#infect()

source $VIMRUNTIME/ftplugin/man.vim

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
set nu
if has("mac")
    colo darkblue
    set guifont=Monaco:h13 " set font to Consolas, height 11
else
    colo evening
endif

set nobackup
set ic 	"ignore case when search, to turn it off, run :set noic
set smartindent
set autoindent
set guioptions-=T 
"autocmd FileType c,cpp,h,asp,html set shiftwidth=4 | set tabstop=4 | set expandtab  
set shiftwidth=4 " set auto indent width to 4 when switch lines
set tabstop=4 " set indent width to 4
set expandtab " use spaces instead of tab 

let g:html_use_css = 0 " don't use css 

autocmd BufNewFile *.py      0r ~/.vim/skeleton/py.skel
autocmd BufNewFile Android.mk 0r ~/.vim/skeleton/Android.mk.skel
autocmd BufNewFile *.tex    0r ~/.vim/skeleton/tex.skel

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

" support aapt errorformat
let &efm = '\ %#[aapt]\ %f:%l:\ %m,' . &efm
" support ant errorformat, see :help errorformat-ant and :help let-option
let &efm = '%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#,' . &efm

" nerdtree options
nnoremap \nt    :NERDTreeFocus<CR>
nnoremap \nT    :NERDTree 
nnoremap \nf    :NERDTreeFind<CR>

" snipMate options
let g:snippets_dir = "$HOME/.vim/snippets"
let g:snips_email = "rx.wen218@gmail.com"
let g:snips_author = "Raymond Wen"

" finder utility
nnoremap \fi :Find 
nnoremap \fI :FindNoCase 
nnoremap \lo :Locate 

" tagbar options
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_left = 1
nnoremap \tg :TagbarToggle<CR>

nnoremap \m  :Man 

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_previous_completion = [] "disable default key
let g:ycm_key_list_select_completion = [] "disable default key
"let g:ycm_key_invoke_completion = '<C-XC-O>'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/ycm/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_seed_identifiers_with_syntax = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 0
