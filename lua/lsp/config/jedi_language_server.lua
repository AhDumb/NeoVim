local util = require 'lspconfig.util'

local root_files = {
  'pyproject.toml',
  'setup.py',
  'setup.cfg',
  'requirements.txt',
  'Pipfile',
}

local opts = {
  settings = {
    default_config = {
      cmd = { 'jedi-language-server' },
      filetypes = { 'python' },
      root_dir = util.root_pattern(unpack(root_files)),
      single_file_support = true,
    },
    docs = {
      description = [[ 
      https://github.com/pappasam/jedi-language-server

      `jedi-language-server`, a language server for Python, built on top of jedi
      ]],
      default_config = {
        root_dir = "vim's starting directory",
      }
    },
    on_attach = function(client, bufnr)
     -- 禁用格式化功能，交给专门插件插件处理
     client.resolved_capabilities.document_formatting = false
     client.resolved_capabilities.document_range_formatting = false

     local function buf_set_keymap(...)
       vim.api.nvim_buf_set_keymap(bufnr, ...)
     end

     -- 绑定快捷键
     require('keybindings').mapLSP(buf_set_keymap)
     -- 保存时自动格式化
     -- vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
   end,
  }
}

return {
  on_setup = function(server)
    server:setup(opts)
  end,
}
