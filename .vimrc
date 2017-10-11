set nocompatible

"Vundle
filetype off
if has('win32') || has('win64')
	set guifont=Consolas:h11:cANSI
	set rtp+=$HOME/vimfiles/bundle/vundle/
	call vundle#begin('$USERPROFILE/vimfiles/bundle/')
	set backupdir=$HOME\\vimfiles\\backup\\
	set directory=$HOME\\vimfiles\\swp\\
	set makeprg=nmake
else
	" Usual quickstart instructions
	set runtimepath+=~/.vim/bundle/vundle/
	call vundle#begin()
	set backupdir=~/.vim/backup//
	set directory=~/.vim/swp//
endif
filetype plugin on
syntax enable

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-dispatch'
Plugin 'altercation/vim-colors-solarized'
Plugin 'othree/yajs.vim'
Plugin 'gavocanov/vim-js-indent'
Plugin 'flazz/vim-colorschemes'
Plugin 'junegunn/vim-easy-align'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mxw/vim-jsx.git'
Plugin 'elzr/vim-json'
Plugin 'ryanoasis/vim-devicons'
Plugin 'elmcast/elm-vim'
Plugin 'w0rp/ale'
Plugin 'Shougo/neocomplete.vim'
Plugin 'neovimhaskell/haskell-vim'
call vundle#end()

" Elm
let g:elm_format_autosave = 1
autocmd bufenter *.elm set ft=elm
call neocomplete#util#set_default_dictionary(
  \ 'g:neocomplete#sources#omni#input_patterns',
  \ 'elm',
  \ '\.')

"Basic setup
let mapleader=' '
set hidden
silent! colors solarized
set guioptions-=T
set laststatus=2
set showtabline=2
" set guioptions-=e
set ignorecase
set smartcase
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set number
nnoremap Y y$
inoremap jj <esc>
nnoremap <esc> :noh<cr>:lclose<cr>
nnoremap <c-PageUp> :bp<cr>
nnoremap <c-PageDown> :bn<cr>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

" syntax
nnoremap [os :syntax on<cr>
nnoremap ]os :syntax off<cr>

"Easy align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" JSON
let g:vim_json_syntax_conceal = 0

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'

" NERDTree
nnoremap <F11> :NERDTreeToggle<cr>
nnoremap <leader><tab> :NERDTreeFocus<cr>
let NERDTreeIgnore=['\.pyc$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Windows
nnoremap <leader>w <c-w>w
nnoremap <leader>o <c-w>o
nnoremap <leader>c <c-w>c
nnoremap <leader>b :b#<cr>
nnoremap <c-m> <c-n>
nnoremap <leader>b :b#<cr>

" <C-V>-paste in insert mode
inoremap <c-v> <c-r><c-p>+

" Leader maps
" Edit vimrc
nnoremap <leader>v :e $MYVIMRC<CR>wgf
" Find next occurence of that thing i just deleted
nnoremap <leader>n /\<<C-R>-\><CR>

" ALE
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_linters = {'javascript': ['eslint']}
nnoremap coa :ALEToggle<cr>

" Fugitive
nmap <leader><space> :Gstatus<cr>

set bg=dark

"Open all buffers in vertical diff view
function! DiffView()
	bufdo difft | vsplit
	close	" Close the initial window
endfunction
" nnoremap <leader>l :execute "bufdo difft | vsplit"<CR>:clo<CR>
nnoremap <leader>d :call DiffView()<CR><CR>

" XML formatter
function! DoFormatXML() range
	" Execute external formatter
	silent %!python -c "import sys;import xml.dom.minidom;s=sys.stdin.read();print(xml.dom.minidom.parseString(s).toprettyxml())"
	silent! g/^\s*$/d   " Delete empty lines
	silent! g/^\w/-1,.j " Join tags with direct content
	silent! %s/>\ />/g  " Fix spaces created by join
	silent! %s/\t/  /g  " Replace tabs
endfunction
nmap <silent> <leader>x :call DoFormatXML()<CR>
