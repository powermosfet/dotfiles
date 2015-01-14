"Pathogen!!!
execute pathogen#infect()

"Basic setup
set nocompatible
filetype plugin on
set number
let mapleader=','
set encoding=utf-8
set fileencoding=utf-8

"Search
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <esc> :noh<return><esc>
set nowrap

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'


"Tab
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

"improve looks
set cursorline
colors flatland
set guifont=Consolas:h11:cANSI
syntax on
set laststatus=2
set statusline=[%l,%c]:\ %F%m%r%h%w\ %y
"No toolbar
set guioptions-=T

" <C-V>-paste in insert mode
inoremap <c-v> <c-r>+

nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>s :so $MYVIMRC<CR>

nnoremap <C-left> <C-W><
nnoremap <C-right> <C-W>>
nnoremap <C-up> <C-W>+
nnoremap <C-down> <C-W>-

"Open all buffers in vertical diff view
function! DiffView()
	bufdo difft | vsplit
	close	" Close the initial window
endfunction
" nnoremap <leader>l :execute "bufdo difft | vsplit"<CR>:clo<CR>
nnoremap <leader>d :call DiffView()<CR><CR>

nnoremap  <C-]>

" XML formatter
function! DoFormatXML() range
	" Execute external formatter
	silent %!python -c "import sys;import xml.dom.minidom;s=sys.stdin.read();print xml.dom.minidom.parseString(s).toprettyxml()"
	silent! g/^\s*$/d   " Delete empty lines
	silent! g/^\w/-1,.j " Join tags with direct content
	silent! %s/>\ />/g  " Fix spaces created by join
endfunction

nmap <silent> <leader>x :call DoFormatXML()<CR>

function! XStringToString() 
	silent %!python -c "import sys;it=iter(sys.stdin.read());print ''.join(chr(int(a+next(it),16)) for a in it)"
endfunction

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>= mmvip:Align=<cr>'m
