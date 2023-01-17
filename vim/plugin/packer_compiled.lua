-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/asmund/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/asmund/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/asmund/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/asmund/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/asmund/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-ultisnips"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips",
    url = "https://github.com/quangnguyen30192/cmp-nvim-ultisnips"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["exrc.nvim"] = {
    config = { "\27LJ\2\n…\1\0\0\4\0\b\0\r6\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\3\0'\2\2\0B\0\2\0029\0\4\0005\2\6\0005\3\5\0=\3\a\2B\0\2\1K\0\1\0\nfiles\1\0\0\1\5\0\0\16.nvimrc.lua\f.nvimrc\14.exrc.lua\n.exrc\nsetup\frequire\texrc\6o\bvim\0" },
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/exrc.nvim",
    url = "https://github.com/MunifTanjim/exrc.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29sharedconfig.plugins.cmp\frequire\0" },
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nª\1\0\0\4\0\v\0\0156\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0004\3\0\0=\3\b\0025\3\t\0=\3\n\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\19ignore_install\1\0\1\17auto_install\2\nsetup\28nvim-treesitter.configs\frequire\5\aCC\benv\bvim\0" },
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { "\27LJ\2\nÒ\3\0\0\6\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\16\0005\3\b\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\4=\4\t\0035\4\n\0005\5\v\0=\5\f\0045\5\r\0=\5\14\4=\4\15\3=\3\17\2B\0\2\1K\0\1\0\16textobjects\1\0\0\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\20selection_modes\1\0\1\20@function.outer\6V\fkeymaps\1\0\6\aac\17@class.outer\aic\17@class.inner\aif\20@function.inner\aai\21@parameter.inner\aaf\20@function.outer\aaa\21@parameter.outer\1\0\3#include_surrounding_whitespace\1\venable\2\14lookahead\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tocto\frequire\0" },
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["purescript-vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/opt/purescript-vim",
    url = "https://github.com/purescript-contrib/purescript-vim"
  },
  ["telescope-vim-bookmarks.nvim"] = {
    config = { "\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\18vim_bookmarks\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/telescope-vim-bookmarks.nvim",
    url = "https://github.com/tom-anders/telescope-vim-bookmarks.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ultisnips = {
    config = { "      vim.g.UltiSnipsExpandTrigger = \"<tab>\"\n      vim.g.UltiSnipsJumpForwardTrigger = \"<c-n>\"\n      vim.g.UltiSnipsJumpBackwardTrigger = \"<c-p>\"\n      vim.g.UltiSnipsEditSplit = 'vertical'\n      vim.g.UltiSnipsRemoveSelectModeMappings = 0\n    " },
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["vim-bookmarks"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/vim-bookmarks",
    url = "https://github.com/MattesGroeger/vim-bookmarks"
  },
  ["vim-colorschemes"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/vim-colorschemes",
    url = "https://github.com/flazz/vim-colorschemes"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-lilypond"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/opt/vim-lilypond",
    url = "https://github.com/sersorrel/vim-lilypond"
  },
  ["vim-ragtag"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/vim-ragtag",
    url = "https://github.com/tpope/vim-ragtag"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-speeddating"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/vim-speeddating",
    url = "https://github.com/tpope/vim-speeddating"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/asmund/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: ultisnips
time([[Config for ultisnips]], true)
      vim.g.UltiSnipsExpandTrigger = "<tab>"
      vim.g.UltiSnipsJumpForwardTrigger = "<c-n>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<c-p>"
      vim.g.UltiSnipsEditSplit = 'vertical'
      vim.g.UltiSnipsRemoveSelectModeMappings = 0
    
time([[Config for ultisnips]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tocto\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)
-- Config for: nvim-treesitter-textobjects
time([[Config for nvim-treesitter-textobjects]], true)
try_loadstring("\27LJ\2\nÒ\3\0\0\6\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\16\0005\3\b\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\4=\4\t\0035\4\n\0005\5\v\0=\5\f\0045\5\r\0=\5\14\4=\4\15\3=\3\17\2B\0\2\1K\0\1\0\16textobjects\1\0\0\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\20selection_modes\1\0\1\20@function.outer\6V\fkeymaps\1\0\6\aac\17@class.outer\aic\17@class.inner\aif\20@function.inner\aai\21@parameter.inner\aaf\20@function.outer\aaa\21@parameter.outer\1\0\3#include_surrounding_whitespace\1\venable\2\14lookahead\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-textobjects")
time([[Config for nvim-treesitter-textobjects]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29sharedconfig.plugins.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: exrc.nvim
time([[Config for exrc.nvim]], true)
try_loadstring("\27LJ\2\n…\1\0\0\4\0\b\0\r6\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\3\0'\2\2\0B\0\2\0029\0\4\0005\2\6\0005\3\5\0=\3\a\2B\0\2\1K\0\1\0\nfiles\1\0\0\1\5\0\0\16.nvimrc.lua\f.nvimrc\14.exrc.lua\n.exrc\nsetup\frequire\texrc\6o\bvim\0", "config", "exrc.nvim")
time([[Config for exrc.nvim]], false)
-- Config for: telescope-vim-bookmarks.nvim
time([[Config for telescope-vim-bookmarks.nvim]], true)
try_loadstring("\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\18vim_bookmarks\19load_extension\14telescope\frequire\0", "config", "telescope-vim-bookmarks.nvim")
time([[Config for telescope-vim-bookmarks.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nª\1\0\0\4\0\v\0\0156\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0004\3\0\0=\3\b\0025\3\t\0=\3\n\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\19ignore_install\1\0\1\17auto_install\2\nsetup\28nvim-treesitter.configs\frequire\5\aCC\benv\bvim\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lilypond ++once lua require("packer.load")({'vim-lilypond'}, { ft = "lilypond" }, _G.packer_plugins)]]
vim.cmd [[au FileType purescript ++once lua require("packer.load")({'purescript-vim'}, { ft = "purescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType purs ++once lua require("packer.load")({'purescript-vim'}, { ft = "purs" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/asmund/.local/share/nvim/site/pack/packer/opt/purescript-vim/ftdetect/purescript.vim]], true)
vim.cmd [[source /home/asmund/.local/share/nvim/site/pack/packer/opt/purescript-vim/ftdetect/purescript.vim]]
time([[Sourcing ftdetect script at: /home/asmund/.local/share/nvim/site/pack/packer/opt/purescript-vim/ftdetect/purescript.vim]], false)
time([[Sourcing ftdetect script at: /home/asmund/.local/share/nvim/site/pack/packer/opt/vim-lilypond/ftdetect/lilypond.vim]], true)
vim.cmd [[source /home/asmund/.local/share/nvim/site/pack/packer/opt/vim-lilypond/ftdetect/lilypond.vim]]
time([[Sourcing ftdetect script at: /home/asmund/.local/share/nvim/site/pack/packer/opt/vim-lilypond/ftdetect/lilypond.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
