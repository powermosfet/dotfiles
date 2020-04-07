set nocompatible
set encoding=utf-8

call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'shumphrey/fugitive-gitlab.vim'
    Plug 'tpope/vim-sleuth'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-ragtag'
    Plug 'MattesGroeger/vim-bookmarks'

    Plug 'SirVer/ultisnips'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'flazz/vim-colorschemes'
    Plug 'scrooloose/nerdtree', { 'on':  [ 'NERDTreeFocus', 'NERDTreeFind' ] }
    Plug 'mogelbrod/vim-jsonpath'

    Plug 'elmcast/elm-vim'
call plug#end()

set nofixendofline
colorscheme solarized
set number
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/elm-stuff/*,*/node_modules/*,*/build/*
set hidden
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set ignorecase
set smartcase
set nowrap
set hlsearch
set signcolumn=yes
set updatetime=300
set mouse=nicr
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

nmap <silent> gd       <Plug>(coc-definition)
nmap <silent> gy       <Plug>(coc-type-definition)
nmap <silent> gi       <Plug>(coc-implementation)
nmap <silent> gr       <Plug>(coc-references)
nmap <silent> <cr>     :call CocAction('doHover')<cr>
nmap <silent> ((       <Plug>(coc-diagnostic-prev)
nmap <silent> ))       <Plug>(coc-diagnostic-next)
nnoremap <C-p>         :GFiles --exclude-standard --others --cached<cr>
nmap <tab> <c-w>
let mapleader=" "
nnoremap <leader>b     :Buffers<cr>
nnoremap <leader>m     :Marks<cr>
nnoremap <leader>/     :<C-u>CocList outline<cr>
nnoremap <leader>v     :e $MYVIMRC<cr>Wgf
nnoremap <leader><tab> :NERDTreeFocus<cr>
nnoremap <leader>f     :NERDTreeFind<cr>
nnoremap <leader>o     :b#<cr>
nnoremap <leader>n     :noh<cr>
nnoremap <leader>p     <c-w>p<c-w>c
nnoremap <leader>h     VgUyypVr=
nnoremap <leader>qf    <Plug>(coc-fix-current)
nmap <leader>rn        <Plug>(coc-rename)
nnoremap <leader>gr    yiw:Ag <c-r>"<cr>
vnoremap <leader>gr    y:Ag <c-r>"<cr>
nnoremap <leader>g%    :Ag <c-r>=expand("%:t")<cr><cr>
vnoremap <leader>gf    y:FZF -q <c-r>"<cr>
nnoremap <leader>&     :CocList quickfix<cr>

let g:ragtag_global_maps = 1

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Commands
command Fm Start vifm %:p:h

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsListSnippets="<c-w>"
inoremap <c-w> <c-o>:Snippets<cr>
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

function! NoteMode()
    nnoremap <silent> <leader><leader> mo:s/^[☐☑x]/\=submatch(0)=='☐'?'☑':'☐'/<cr>`o
    nnoremap <silent> <leader>x        mo:s/^[☐☑x]/x/<cr>`o
    nnoremap + o☐ 
    set nohlsearch
    echo "Note mode activated"
endfunction

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
