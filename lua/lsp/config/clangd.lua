local util = require 'lspconfig.util'

local function switch_source_header(bufnr)
  bufnr = util.validate_bufnr(bufnr)
  local clangd_client = util.get_active_client_by_name(bufnr, 'clangd')
  local params = { uri = vim.uri_from_bufnr(bufnr) }
  if clangd_client then
    clangd_client.request('textDocument/switchSourceHeader', params, function(err, result)
      if err then
        error(tostring(err))
      end
      if not result then
        print 'Corresponding file cannot be determined'
        return
      end
      vim.api.nvim_command('edit ' .. vim.uri_to_fname(result))
    end, bufnr)
  else
    print 'method textDocument/switchSourceHeader is not supported by any servers active on the current buffer'
  end
end

local root_pattern = util.root_pattern('compile_commands.json', 'compile_flags.txt', '.git')

local default_capabilities = vim.tbl_deep_extend(
'force',
util.default_config.capabilities or vim.lsp.protocol.make_client_capabilities(),
{
  textDocument = {
    completion = {
      editsNearCursor = true,
    },
  },
  offsetEncoding = { 'utf-8', 'utf-16' },
}
)

local opts = {
  settings = {
    default_config = {
      cmd = { 'clangd' },
      filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
      root_dir = function(fname)
        local filename = util.path.is_absolute(fname) and fname or util.path.join(vim.loop.cwd(), fname)
        return root_pattern(filename)
      end,
      single_file_support = true,
      capabilities = default_capabilities,
    },
    commands = {
      ClangdSwitchSourceHeader = {
        function()
          switch_source_header(0)
        end,
        description = 'Switch between source/header',
      },
    },
    docs = {
      description = [[
      https://clangd.llvm.org/installation.html

      **NOTE:** Clang >= 9 is recommended! See [this issue for more](https://github.com/neovim/nvim-lsp/issues/23).

      clangd relies on a [JSON compilation database](https://clang.llvm.org/docs/JSONCompilationDatabase.html) specified
      as compile_commands.json or, for simpler projects, a compile_flags.txt.
      For details on how to automatically generate one using CMake look [here](https://cmake.org/cmake/help/latest/variable/CMAKE_EXPORT_COMPILE_COMMANDS.html). Alternatively, you can use [Bear](https://github.com/rizsotto/Bear).
        ]],
        default_config = {
          root_dir = [[root_pattern("compile_commands.json", "compile_flags.txt", ".git") or dirname]],
          capabilities = [[default capabilities, with offsetEncoding utf-8]],
        }
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

  return {
    on_setup = function(server)
      server:setup(opts)
    end,
  }

