local util = require 'lspconfig.util'

local bin_name = 'pyright-langserver'
local cmd = { bin_name, '--stdio' }

if vim.fn.has 'win32' == 1 then
  cmd = { 'cmd.exe', '/C', bin_name, '--stdio' }
end

local root_files = {
  'pyproject.toml',
  'setup.py',
  'setup.cfg',
  'requirements.txt',
  'Pipfile',
  'pyrightconfig.json',
}

local function organize_imports()
  local params = {
    command = 'pyright.organizeimports',
    arguments = { vim.uri_from_bufnr(0) },
  }
  vim.lsp.buf.execute_command(params)
end

local opts = {
  settings = {
    default_config = {
      cmd = cmd,
      filetypes = { 'python' },
      root_dir = util.root_pattern(unpack(root_files)),
      single_file_support = true,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'workspace',
      }
    },
    commands = {
      PyrightOrganizeImports = {
        organize_imports,
        description = 'Organize Imports',
      }
    },
    docs = {
      description = [[ 
      https://github.com/microsoft/pyright

      `pyright`, a static type checker and language server for python
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
