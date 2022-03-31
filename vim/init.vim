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
  Plug 'tom-anders/telescope-vim-bookmarks.nvim'
  Plug 'SirVer/ultisnips'
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
  Plug 'jacoborus/tender.vim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'
  Plug 'hrsh7th/nvim-compe'
  Plug 'folke/trouble.nvim'

  " Telescope and dependencies
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " Languages
  Plug 'LnL7/vim-nix'

  Plug 'scrooloose/nerdtree', { 'on':  [ 'NERDTreeFocus', 'NERDTreeFind' ] }
call plug#end()

colorscheme onehalfdark

let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

command! Fm Start vifm %:p:h

lua << EOF

local g = vim.g
local api = vim.api

vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'disable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}

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
  ["<BS>"]        = [[:BufferPrevious<CR>]],
  ["<TAB>"]       = [[:BufferNext<CR>]],
  ["<C-BS>"]      = [[:BufferMovePrevious<CR>]],
  ["<C-TAB>"]     = [[:BufferMoveNext<CR>]],
  ["[g"]          = [[:lua vim.lsp.diagnostic.goto_prev()<CR>]],
  ["]g"]          = [[:lua vim.lsp.diagnostic.goto_next()<CR>]],
  ["<leader>"]    = {
    ["v"]         = [[:tabe <c-r>=resolve($MYVIMRC)<cr><cr>]],
    ["n"]         = [[:noh<cr>]],
    ["c"]         = [[:close<cr>]],
    [","]         = [[:tabp<cr>]],
    ["."]         = [[:tabn<cr>]],
    -- Tabs
    ["t"]         = {
      ["c"]       = [[:tabclose<cr>]],
      ["o"]       = [[:tabonly<cr>]],
      ["e"]       = [[:tabe ]],
    },
    -- Search
    ["s"]         = {
      ["w"]       = [[:Telescope grep_string<cr>]],
      ["l"]       = [[:Telescope live_grep<cr>]],
    },
    -- Buffer
    ["b"]         = {
      ["l"]       = [[:Telescope buffers<cr>]],
      ["o"]       = [[:b#<cr>]],
      ["d"]       = [[:bd<cr>]],
      ["c"]       = [[:BufferClose<cr>]],
    },
    -- Files
    ["f"]         = {
      ["f"]       = [[:Telescope find_files<cr>]],
      ["b"]       = [[:Telescope file_browser<cr>]],
      ["t"]       = [[:NERDTreeFocus<cr>]],
      ["T"]       = [[:NERDTreeFind<cr>]],
    },
    -- Git
    ["g"]         = {
      ["<space>"] = [[:G ]],
      ["g"]       = [[:G blame<cr>]],
      ["b"]       = [[:Telescope git_branches<cr>]],
      ["c"]       = [[:Telescope git_bcommits<cr>]],
      ["s"]       = [[:G<cr>]],
      ["f"]       = [[:Git fetch --prune<cr>]],
      ["p"]       = [[:Git pull --ff-only<cr>]],
      ["o"]       = [[:Git checkout ]],
      ["n"]       = [[/\(<<<<<<<\|=======\||||||||\|>>>>>>>\)<cr>]]
    },
    ["l"]         = {
      ["z"]       = [[:LspRestart<CR>]],
      ["f"]       = [[:lua vim.lsp.buf.formatting()<CR>]],
      ["D"]       = [[:lua vim.lsp.buf.declaration()<CR>]],
      ["d"]       = [[:lua vim.lsp.buf.definition()<CR>]],
      ["h"]       = [[:lua vim.lsp.buf.hover()<CR>]],
      ["i"]       = [[:lua vim.lsp.buf.implementation()<CR>]],
      ["R"]       = [[:lua vim.lsp.buf.rename()<CR>]],
      ["a"]       = [[:Telescope lsp_code_actions<CR>]],
      ["r"]       = [[:Telescope lsp_references<CR>]],
      ["gb"]      = [[:Telescope lsp_document_diagnostics<CR>]],
      ["gw"]      = [[:Telescope lsp_workspace_diagnostics<CR>]],
      ["/"]       = [[:Telescope lsp_document_symbols<CR>]],
      ["g/"]      = [[:Telescope lsp_workspace_symbols<CR>]]
    }
  },
  -- vim-bookmarks
  ["m"]           = {
    ["l"]         = [[:Telescope vim_bookmarks current_file<cr>]],
    ["L"]         = [[:Telescope vim_bookmarks all<cr>]]
  }

}

kmap("", keymaps)

require('telescope').load_extension('vim_bookmarks')

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
  local localConfig = loadfile('./local-vim.lua')()

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
