local util = require 'lspconfig.util'

local opts = {
  settings = {
    default_config = {
      cmd = { 'pylsp' },
      filetype = { 'python' },
      root_dir = function(fname)
        local root_files = {
          'pyproject.toml',
          'setup.py',
          'setup.cfg',
          'requirements.txt',
          'Pipfile',
        }
        return util.root_pattern(unpack(root_files) or util.find_git_ancestor(fname))
      end,
      single_file_support = true,
    },
    docs = {
      description = [[
      https://github.com/python-lsp/python-lsp-server
      A Python 3.6+ implementation of the Language Server Protocol.

      The language server can be installed via `pipx install 'python-lsp-server[all]'`.
      Further instructions can be found in the [project's README](https://github.com/python-lsp/python-lsp-server).

      Note: This is a community fork of `pyls`.
      ]]
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
