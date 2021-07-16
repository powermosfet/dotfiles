call plug#begin('~/.vim/plugged')
  Plug 'neovim/nvim-lspconfig'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-sleuth'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'SirVer/ultisnips'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'gfanto/fzf-lsp.nvim'
  Plug 'flazz/vim-colorschemes'
  Plug 'scrooloose/nerdtree', { 'on':  [ 'NERDTreeFocus', 'NERDTreeFind' ] }
call plug#end()

set nofixendofline
colorscheme flattr
set number
set relativenumber
set mouse=nicr
set ignorecase
set smartcase
set hidden

let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

command Fm Start vifm %:p:h

nnoremap <c-p>         :GFiles<cr>
let mapleader=" "
nnoremap <leader>v     :tabe <c-r>=resolve($MYVIMRC)<cr><cr>
nnoremap <leader>b     :Buffers<cr>
nnoremap <leader><tab> :NERDTreeFocus<cr>
nnoremap <leader>f     :NERDTreeFind<cr>
nnoremap <leader>o     :b#<cr>
nnoremap <leader>n     :noh<cr>
nnoremap <leader>gr    yiw:Ag <c-r>"<cr>
vnoremap <leader>gr    y:Ag <c-r>"<cr>
nnoremap <leader>g%    :Ag <c-r>=expand("%:t")<cr><cr>
vnoremap <leader>gf    y:FZF -q <c-r>"<cr>
nnoremap <leader>c     :close<cr>
nnoremap <leader>tc    :tabclose<cr>
nnoremap <leader>d     :bd<cr>
nnoremap <leader>,     :tabp<cr>
nnoremap <leader>.     :tabn<cr>

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  
  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  
  -- Mappings.
  local opts = { noremap=true, silent=true }
  
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>References<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap("n", "<space>/", "<cmd>DocumentSymbols<CR>", opts)
end

local f=io.open('local-vim.lua','r')
if f~=nil then
  io.close(f)
  local localConfig = require('local-vim')

  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  local servers = localConfig.lspServers -- { "elmls", "yamlls" }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 500,
      }
    }
  end

  localConfig.config()
end
EOF
