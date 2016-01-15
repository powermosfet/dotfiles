set nocompatible

"Vundle
filetype off
if has('win32') || has('win64')
	set runtimepath+=~/vimfiles/bundle/vundle/
	call vundle#rc('$HOME/vimfiles/bundle/')
	set guifont=Consolas:h11:cANSI
else
	" Usual quickstart instructions
	set runtimepath+=~/.vim/bundle/vundle/
	call vundle#rc()
endif
filetype plugin indent on
syntax enable

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-flagship'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-dispatch'
Plugin 'altercation/vim-colors-solarized'
Plugin 'pangloss/vim-javascript'
Plugin 'flazz/vim-colorschemes'
Plugin 'junegunn/vim-easy-align'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mxw/vim-jsx.git'
" Bundle 'scrooloose/syntastic'

"Basic setup
let mapleader=','
set hidden
silent! colors solarized
set guioptions-=T
set laststatus=2
set showtabline=2
set guioptions-=e
set ignorecase
set smartcase
set tabstop=4
set number
nnoremap Y y$
inoremap jj <esc>

" syntax
nnoremap [os :syntax on<cr>
nnoremap ]os :syntax off<cr>

"Easy align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'

" NERDTree
nnoremap <F11> :NERDTreeFocus<cr>

" <C-V>-paste in insert mode
inoremap <c-v> <c-r>+

nnoremap <leader>v :e $MYVIMRC<CR>wgf
nnoremap <leader>s :so $MYVIMRC<CR>

" "Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
	silent %!python -c "import sys;import xml.dom.minidom;s=sys.stdin.read();print xml.dom.minidom.parseString(s).toprettyxml()"
	silent! g/^\s*$/d   " Delete empty lines
	silent! g/^\w/-1,.j " Join tags with direct content
	silent! %s/>\ />/g  " Fix spaces created by join
endfunction
nmap <silent> <leader>x :call DoFormatXML()<CR>
