call plug#begin('~/.vim/neovim-plugged')
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
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'flazz/vim-colorschemes'
  Plug 'scrooloose/nerdtree', { 'on':  [ 'NERDTreeFocus', 'NERDTreeFind' ] }
call plug#end()

colorscheme flattr

let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

command Fm Start vifm %:p:h

lua << EOF

local g = vim.g
local api = vim.api

local keymapOptions = { noremap=true, silent=true }

api.nvim_set_keymap("n", "<c-p>", ":Telescope find_files<cr>", keymapOptions)

g.mapleader = [[ ]]
g.maplocalleader = [[ ]]

local leaderMaps = {
  ["<c-p>"] = ":Telescope file_browser<cr>",
  ["v"] =     ":tabe <c-r>=resolve($MYVIMRC)<cr><cr>",
  ["b"] =     ":Telescope buffers<cr>",
  ["<tab>"] = ":NERDTreeFocus<cr>",
  ["f"] =     ":NERDTreeFind<cr>",
  ["o"] =     ":b#<cr>",
  ["n"] =     ":noh<cr>",
  ["gr"] =    ":Telescope grep_string<cr>",
  ["c"] =     ":close<cr>",
  ["tc"] =    ":tabclose<cr>",
  ["d"] =     ":bd<cr>",
  [","] =     ":tabp<cr>",
  ["."] =     ":tabn<cr>",
  ["gb"] =    ":Telescope git_branches<cr>",
  ["gc"] =    ":Telescope git_bcommits<cr>"
}

for k, v in pairs(leaderMaps) do
  api.nvim_set_keymap("n", "<leader>" .. k, v, keymapOptions)
end

-- OPTIONS

local set_all = function(value, list)
  for _, item in pairs(list) do
    vim.o[item] = value
  end
end

set_all(true, { "termguicolors", "hidden", "splitright", "number", "relativenumber", "ignorecase", "smartcase" })
set_all(false, { "fixendofline" })
set_all("nicr", { "mouse" })


-- LANGUAGE SERVERS

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
  buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>qb', '<cmd>Telescope lsp_document_diagnostics<CR>', opts)
  buf_set_keymap('n', '<space>qw', '<cmd>Telescope lsp_workspace_diagnostics<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap("n", "<space>/", "<cmd>Telescope lsp_document_symbols<CR>", opts)
end

-- check if "local-vim.lua" exists in current dir
-- and load it as a module. Expect it to have the following interface:
--
-- {
--  lspServers : list of strings
--  config : function with any other config
-- }

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
