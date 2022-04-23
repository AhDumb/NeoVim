local packer = require('packer')

packer.init({
  git = {
    default_url_format = 'git@git.zhlh6.cn:%s.git'
  }
})

packer.startup({function()

  -- 插件管理工具
  use 'wbthomason/packer.nvim'

  -------------------------- 美化插件 Start --------------------------

  -- tokyonight
  use 'folke/tokyonight.nvim'

  -- 状态栏
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'arkav/lualine-lsp-progress'
    }
  }

  -- buffer
  use {
    'akinsho/bufferline.nvim',
    requires = {
      "kyazdani42/nvim-web-devicons",
      "moll/vim-bbye"
    }
  }

  -- dashboard-nvim 启动页
  use 'glepnir/dashboard-nvim'

  -- ui
  use 'onsails/lspkind-nvim'

  use 'stevearc/dressing.nvim'

  -------------------------- 美化插件 End ----------------------------

  -------------------------- 功能插件 Start --------------------------

  -- nvim-tree 文件浏览器
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- lspconfig
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    'tami5/lspsaga.nvim'
  }

  -- 补全引擎
  use 'hrsh7th/nvim-cmp'
  -- snippet 引擎
  use 'hrsh7th/vim-vsnip'
  -- 补全源
  use {
    'hrsh7th/cmp-vsnip',
    'hrsh7th/cmp-nvim-lsp', -- { name = nvim_lsp }
    'hrsh7th/cmp-buffer', -- { name = 'buffer' }
    'hrsh7th/cmp-path', -- { name = 'path' }
    'hrsh7th/cmp-cmdline' -- { name = 'cmdline' }
  }
  -- 常见编程语言代码段
  use 'rafamadriz/friendly-snippets'

  -- 括号自动补全
  use 'jiangmiao/auto-pairs'

  -- 增强代码高亮
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- 文集搜索
  --use 'junegunn/fzf.vim'

  -- 彩虹括号
  use 'luochen1990/rainbow'

  -- 搜索
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  -- Telescopt project
  use 'ahmedkhalf/project.nvim'

  -- Git 状态
  use 'mhinz/vim-signify'

  -- 翻译
  use 'voldikss/vim-translator'

  -- 异步
  use 'skywind3000/asyncrun.vim'

  -- 注释
  --use 'preservim/nerdcommenter'
  use 'tomtom/tcomment_vim'

  -- 格式化代码
  use 'Chiel92/vim-autoformat'

  -- 大纲
  use 'majutsushi/tagbar'

  -- 变量 函数 列表
  use 'yegappan/taglist'

  -- 自动切换输入法
  use 'rlue/vim-barbaric'

  -- Markdown
  use {
    'godlygeek/tabular',
    'plasticboy/vim-markdown'
  }

  -- Markdown 预览
  use {
    'iamcco/markdown-preview.nvim',
    run = "cd app && yarn install"
  }

  -- 浮动终端
  use 'voldikss/vim-floaterm'

  -- Cmake
  --use 'cdelledonne/vim-cmake'
  -- use {
  --   'Shatur/neovim-cmake',
  --   'mfussenegger/nvim-dap',
  --   'nvim-lua/plenary.nvim'
  -- }

  -- 一键运行代码
  use {
    'CRAG666/code_runner.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  -- indent-blankline
  use 'lukas-reineke/indent-blankline.nvim'

  -- 注释
  use {
    'danymat/neogen',
    requires = 'nvim-treesitter/nvim-treesitter'
  }

  -------------------------- 功能插件 End ----------------------------

  -------------------------- 其他插件 Start --------------------------

  -- 中文帮助文档
  use 'yianwillis/vimcdoc'

  -- 滚动翻页
  use 'psliwka/vim-smoothie'

  -------------------------- 其他插件 End ----------------------------

end,
config = {
  max_jobs = 16,
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})

pcall(
vim.cmd,
[[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerInstall
augroup end
]]
)
