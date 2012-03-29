"Change the leader key
let mapleader = ","

"Searching...
set incsearch showmatch hlsearch
nnoremap <leader><space> :noh<cr>
set gdefault
set ignorecase smartcase


"Turn on "normal" Regexp in search by default
nnoremap / /\v
vnoremap / /\v

"Automatically change directory to that of the current file
"Without breaking the Git plugin
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" && bufname("") !~ "COMMIT_EDITMSG$" | silent! lcd %:p:h:gs/ /\\ / | endif

"Always show statusline
set laststatus=2

"Split windows
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Syntax highlighting
syntax enable

if has("win32")
	"windows stuff...
	"Custom statusline...
	set statusline=[%l]:\ %F%m%r%h%w\ %y
	"Set font
	if has("gui_running")
		set guifont=Droid_Sans_Mono:h10:cANSI
	endif
elseif has("unix")
	"Linux stuff
	"Put the Git branch (if any) in the status line
	set statusline=[%l]%{GitBranch()}:\ %F%m%r%h%w\ %y
	"Set font
	if has("gui_running")
		set guifont=Droid\ Sans\ Mono\ 10
	endif
endif

"Make Ctrl-V paste in insert mode and command mode
imap <C-V> <C-R>+
cmap <C-V> <C-R>+

"Make TAB do something useful in normal and visual mode
nmap <tab> >>
nmap <S-tab> <<
vmap <tab> >
vmap <S-tab> <

"Open vimrc file
nmap gv :e $MYVIMRC<CR>

"Make indentation normal
filetype indent on
set tabstop=4
set shiftwidth=4

"No toolbar
set guioptions-=T
"No menubar
set guioptions-=m

"Expand as much as possible when hitting tab
set wildmode=longest:full
set wildmenu

"Compile stuff..
nmap <F5> :w<CR>:make d<CR>
nmap <F8> :w<CR>:make<CR>

"Try to save when leaving a buffer
function AutoSave()
  try
    silent! w
  catch
  endtry
endfunction
autocmd BufLeave * call AutoSave()

"Taglist
map <F12> :TlistToggle<CR>

"Omni Completion
set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone

"Dark is nice
colors desert

"numbers
set nu
"Relative line numbers - Does not work until 7.3
set relativenumber

"Count up and down
nmap <leader>j <C-x>
nmap <leader>k <C-a>

"Insert blank lines
nmap <CR> mzo<ESC>`z
nmap <S-CR> mzO<ESC>`z

"Newbie save
nmap <C-s> :w<CR>
