require('code_runner').setup {
  term = {
    --position = "belowright",
    size = 8,
    mode = "startinsert"
  },
  filetype_path = vim.fn.expand('~/.config/nvim/code_runner.json')
}
