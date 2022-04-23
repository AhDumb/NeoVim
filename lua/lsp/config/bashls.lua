local util = require 'lspconfig.util'

local bin_name = 'bash-language-server'
local cmd = { bin_name, 'start' }

if vim.fn.has 'win32' == 1 then
  cmd = { 'cmd.exe', '/C', bin_name, 'start' }
end

local opts = {
  settings = {
    default_config = {
      cmd = cmd,
      cmd_env = {
        -- Prevent recursive scanning which will cause issues when opening a file
        -- directly in the home directory (e.g. ~/foo.sh).
        --
        -- Default upstream pattern is "**/*@(.sh|.inc|.bash|.command)".
        GLOB_PATTERN = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)',
      },
      filetypes = { 'sh' },
      root_dir = util.find_git_ancestor,
      single_file_support = true,
    },
    docs = {
      description = [[
      https://github.com/mads-hartmann/bash-language-server

      `bash-language-server` can be installed via `npm`:
      ```sh
      npm i -g bash-language-server
      ```

      Language server for bash, written using tree sitter in typescript.
      ]],
      default_config = {
        root_dir = [[util.find_git_ancestor]],
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
