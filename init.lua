-- 加载基础配置
require('basic')

require('colorscheme')

-- 加载Plugin配置
require('plugins')

require('plugin-config.nvim-bufferline')
require('plugin-config.nvim-code-runner')
require('plugin-config.nvim-tree')
require('plugin-config.nvim-lualine')
require('plugin-config.nvim-dashboard')
require('plugin-config.nvim-project')
require('plugin-config.nvim-treesitter')
require('plugin-config.nvim-indent-blankline')
require('plugin-config.nvim-neogen')
require('plugin-config.nvim-translator')
require('plugin-config.nvim-nerdcommenter')
require('plugin-config.markdown')
-- require('plugin-config.nvim-cmake')

-- 加载 LSP
require('lsp.setup')
require('lsp.cmp')
require('lsp.ui')

-- 加载快捷键配置
require('keybindings')

