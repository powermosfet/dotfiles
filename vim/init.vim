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

  " Telescope and dependencies
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  Plug 'scrooloose/nerdtree', { 'on':  [ 'NERDTreeFocus', 'NERDTreeFind' ] }
call plug#end()

colorscheme slate

let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

command! Fm Start vifm %:p:h

lua << EOF

local g = vim.g
local api = vim.api

local keymapOptions = { noremap=true, silent=false }

function kmap(prefix, definitions) 
  if type(definitions) == "table" then
    for k, a in pairs(definitions) do
      kmap(prefix .. k, a)
    end
  else
    api.nvim_set_keymap("n", prefix, definitions, keymapOptions)
  end
end

g.mapleader = " "
g.maplocalleader = " "

local keymaps = {
  ["[g"]         = [[:lua vim.lsp.diagnostic.goto_prev()<CR>]],
  ["]g"]         = [[:lua vim.lsp.diagnostic.goto_next()<CR>]],
  ["<leader>"] = {
    ["v"]      = [[:tabe <c-r>=resolve($MYVIMRC)<cr><cr>]],
    ["n"]      = [[:noh<cr>]],
    ["c"]      = [[:close<cr>]],
    ["tc"]     = [[:tabclose<cr>]],
    [","]      = [[:tabp<cr>]],
    ["."]      = [[:tabn<cr>]],
    -- Search
    ["s"]      = {
      ["w"]    = [[:Telescope grep_string<cr>]],
      ["l"]    = [[:Telescope live_grep<cr>]],
    },
    -- Buffer
    ["b"]      = {
      ["l"]    = [[:Telescope buffers<cr>]],
      ["o"]    = [[:b#<cr>]],
      ["d"]    = [[:bd<cr>]],
    },
    -- Files
    ["f"]      = {
      ["f"]    = [[:Telescope find_files<cr>]],
      ["b"]    = [[:Telescope file_browser<cr>]],
      ["t"]    = [[:NERDTreeFocus<cr>]],
      ["T"]    = [[:NERDTreeFind<cr>]],
    },
    -- Git
    ["g"]      = {
      ["b"]    = [[:Telescope git_branches<cr>]],
      ["c"]    = [[:Telescope git_bcommits<cr>]],
      ["s"]    = [[:G<cr>]],
      ["f"]    = [[:Git fetch --prune<cr>]],
      ["p"]    = [[:Git pull --ff-only<cr>]],
      ["o"]    = [[:Git checkout ]],
      ["n"]    = [[/\(<<<<<<<\|=======\||||||||\|>>>>>>>\)<cr>]]
    },
    ["l"]        = {
      ["z"]      = [[:LspRestart<CR>]],
      ["f"]      = [[:lua vim.lsp.buf.formatting()<CR>]],
      ["D"]      = [[:lua vim.lsp.buf.declaration()<CR>]],
      ["d"]      = [[:lua vim.lsp.buf.definition()<CR>]],
      ["h"]      = [[:lua vim.lsp.buf.hover()<CR>]],
      ["i"]      = [[:lua vim.lsp.buf.implementation()<CR>]],
      ["R"]      = [[:lua vim.lsp.buf.rename()<CR>]],
      ["a"]      = [[:Telescope lsp_code_actions<CR>]],
      ["r"]      = [[:Telescope lsp_references<CR>]],
      ["gb"]     = [[:Telescope lsp_document_diagnostics<CR>]],
      ["gw"]     = [[:Telescope lsp_workspace_diagnostics<CR>]],
      ["/"]      = [[:Telescope lsp_document_symbols<CR>]],
      ["g/"]     = [[:Telescope lsp_workspace_symbols<CR>]]
    }
  }
}

kmap("", keymaps)

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

-- check if "local-vim.lua" exists in current dir
-- and load it as a module. Expect it to have the following interface:
--
-- {
--  lspServers : list of strings
--  keymaps : Table of keymaps
--  config : function with any other config
-- }

local f=io.open('local-vim.lua','r')
if f~=nil then
  io.close(f)
  local localConfig = require('local-vim')

  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  local servers = localConfig.lspServers
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      flags = {
        debounce_text_changes = 500,
      }
    }
  end

  local localKeymaps = localConfig.keymaps
  kmap("", localKeymaps)

  localConfig.config()
end
EOF
