local util = require 'lspconfig.util'

local opts = {
  settings = {
    default_config = {
      cmd = { 'cmake-language-server' },
      filetypes = { 'cmake' },
      root_dir = util.root_pattern('.git', 'compile_commands.json', 'build'),
      single_file_support = true,
      init_options = {
        buildDirectory = 'build',
      },
    },
    docs = {
      description = [[
      https://github.com/regen100/cmake-language-server

      CMake LSP Implementation
      ]],
      default_config = {
        root_dir = [[root_pattern(".git", "compile_commands.json", "build") or dirname]],
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

