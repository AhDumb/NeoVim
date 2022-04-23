local util = require 'lspconfig.util'

local opts = {
  settings = {
    default_config = {
      cmd = { 'golangci-lint-langserver' },
      filetypes = { 'go', 'gomod' },
      init_options = {
        command = { 'golangci-lint', 'run', '--out-format', 'json' },
      },
      root_dir = function(fname)
        return util.root_pattern 'go.work'(fname) or util.root_pattern('go.mod', '.golangci.yaml', '.git')(fname)
      end,
    },
    docs = {
      description = [[
      Combination of both lint server and client

      https://github.com/nametake/golangci-lint-langserver
      https://github.com/golangci/golangci-lint


      Installation of binaries needed is done via

      ```
      go install github.com/nametake/golangci-lint-langserver@latest
      go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.42.1
      ```
      ]],
      default_config = {
        root_dir = [[root_pattern('go.work') or root_pattern('go.mod', '.golangci.yaml', '.git')]],
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
