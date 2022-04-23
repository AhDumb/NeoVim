local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("没有找到 null-ls")
  return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
  debug = false,
  sources = {
    formatting.shfmt,
    -- StyLua
    formatting.stylua,
    -- frontend
    formatting.prettier.with({
      filetype = {
        "javascript",
        "typescript",
        "json",
        "markdown",
        "java",
        "python",
        "c", "cpp"
      }
    })
  }
})
