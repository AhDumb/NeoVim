local util = require 'lspconfig.util'

local bin_name = 'vscode-json-language-server'
local cmd = { bin_name, '--stdio' }

if vim.fn.has 'win32' == 1 then
  cmd = { 'cmd.exe', '/C', bin_name, '--stdio' }
end

local opts = {
  settings = {
    default_config = {
      md = cmd,
      filetypes = { 'json', 'jsonc' },
      init_options = {
        provideFormatter = true,
      },
      root_dir = util.find_git_ancestor,
      single_file_support = true,
    },
    docs = {
      description = [[
      https://github.com/hrsh7th/vscode-langservers-extracted

      vscode-json-language-server, a language server for JSON and JSON schema

      `vscode-json-language-server` can be installed via `npm`:
      ```sh
      npm i -g vscode-langservers-extracted
      ```

      Neovim does not currently include built-in snippets. `vscode-json-language-server` only provides completions when snippet support is enabled. To enable completion, install a snippet plugin and add the following override to your language client capabilities during setup.

      ```lua
      --Enable (broadcasting) snippet capability for completion
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      require'lspconfig'.jsonls.setup {
        capabilities = capabilities,
      }
      ```
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
