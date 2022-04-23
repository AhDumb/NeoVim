-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/aaron/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/aaron/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/aaron/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/aaron/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/aaron/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/asyncrun.vim",
    url = "git@git.zhlh6.cn:skywind3000/asyncrun.vim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "git@git.zhlh6.cn:jiangmiao/auto-pairs"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "git@git.zhlh6.cn:akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "git@git.zhlh6.cn:hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "git@git.zhlh6.cn:hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "git@git.zhlh6.cn:hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "git@git.zhlh6.cn:hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "git@git.zhlh6.cn:hrsh7th/cmp-vsnip"
  },
  ["code_runner.nvim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/code_runner.nvim",
    url = "git@git.zhlh6.cn:CRAG666/code_runner.nvim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "git@git.zhlh6.cn:glepnir/dashboard-nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "git@git.zhlh6.cn:stevearc/dressing.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "git@git.zhlh6.cn:rafamadriz/friendly-snippets"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "git@git.zhlh6.cn:lukas-reineke/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "git@git.zhlh6.cn:onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "git@git.zhlh6.cn:tami5/lspsaga.nvim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress",
    url = "git@git.zhlh6.cn:arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "git@git.zhlh6.cn:nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "git@git.zhlh6.cn:iamcco/markdown-preview.nvim"
  },
  neogen = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/neogen",
    url = "git@git.zhlh6.cn:danymat/neogen"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "git@git.zhlh6.cn:hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "git@git.zhlh6.cn:williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "git@git.zhlh6.cn:neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "git@git.zhlh6.cn:kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "git@git.zhlh6.cn:nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "git@git.zhlh6.cn:kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "git@git.zhlh6.cn:wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "git@git.zhlh6.cn:nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "git@git.zhlh6.cn:ahmedkhalf/project.nvim"
  },
  rainbow = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/rainbow",
    url = "git@git.zhlh6.cn:luochen1990/rainbow"
  },
  tabular = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/tabular",
    url = "git@git.zhlh6.cn:godlygeek/tabular"
  },
  tagbar = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "git@git.zhlh6.cn:majutsushi/tagbar"
  },
  taglist = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/taglist",
    url = "git@git.zhlh6.cn:yegappan/taglist"
  },
  tcomment_vim = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/tcomment_vim",
    url = "git@git.zhlh6.cn:tomtom/tcomment_vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "git@git.zhlh6.cn:nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "git@git.zhlh6.cn:folke/tokyonight.nvim"
  },
  ["vim-autoformat"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/vim-autoformat",
    url = "git@git.zhlh6.cn:Chiel92/vim-autoformat"
  },
  ["vim-barbaric"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/vim-barbaric",
    url = "git@git.zhlh6.cn:rlue/vim-barbaric"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/vim-bbye",
    url = "git@git.zhlh6.cn:moll/vim-bbye"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "git@git.zhlh6.cn:voldikss/vim-floaterm"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "git@git.zhlh6.cn:plasticboy/vim-markdown"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/vim-signify",
    url = "git@git.zhlh6.cn:mhinz/vim-signify"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/vim-smoothie",
    url = "git@git.zhlh6.cn:psliwka/vim-smoothie"
  },
  ["vim-translator"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/vim-translator",
    url = "git@git.zhlh6.cn:voldikss/vim-translator"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "git@git.zhlh6.cn:hrsh7th/vim-vsnip"
  },
  vimcdoc = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/vimcdoc",
    url = "git@git.zhlh6.cn:yianwillis/vimcdoc"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
