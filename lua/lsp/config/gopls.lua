local util = require 'lspconfig.util'

local opts = {
  settings = {
    default_config = {
      cmd = { 'gopls' },
      filetypes = { 'go', 'gomod', 'gotmpl' },
      root_dir = function(fname)
        return util.root_pattern 'go.work'(fname) or util.root_pattern('go.mod', '.git')(fname)
      end,
      single_file_support = true,
    },
    docs = {
      description = [[
      https://github.com/golang/tools/tree/master/gopls

      Google's lsp server for golang.
      ]],
      default_config = {
        root_dir = [[root_pattern("go.mod", ".git")]],
      },
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
