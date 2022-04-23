vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
local map = vim.api.nvim_set_keymap
local opt = {
  noremap = true,
  silent = true
}

-- 插件快捷键
local pluginKeys = {}

-- 光标移动
map("n", "H", "0", opt)
map("n", "-", "^", opt)
map("n", "e", "$", opt)

map("n", "n", "j", opt)

-- ctrl u / ctrl + d  只移动9行，默认移动半屏
--map("n", "<C-u>", "9k", opt)
--map("n", "<C-d>", "9j", opt)

-- Windows 分屏
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前窗口
map("n", "sc", "<C-w>c", opt)
-- 关闭其他窗口
map("n", "so", "<C-w>o", opt)

-- 窗口移动
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-l>", "<C-w>l", opt)

-- 保存
map("n", "<C-s>", ":w<CR>", opt)

-- 文件浏览器
map("n", "<C-e>", ":NvimTreeToggle<CR>", opt)

-- 安装、更新、删除插件
map("n", "<leader>pi", ":PackerInstall<CR>", opt)
map("n", "<leader>ps", ":PackerSync<CR>", opt)
map("n", "<leader>pc", ":PackerClean<CR>", opt)

-- FZF 搜索当前文件夹
map("n", "<leader>f", ":Telescope find_files<CR>", opt)
map("n", "<leader>a", ":Telescope live_grep<CR>", opt)

-- vim-buffer
map("n", "<C-p>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-n>", ":BufferLineCycleNext<CR>", opt)
--map("n", "<leader>dl", ":BufferLineCloseRight<CR>", opt)
--map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>b", ":BufferLinePickClose<CR>", opt)

-- 翻译
map("n", "<leader>w", ":TranslateW<CR>", opt)
map("v", "<leader>w", ":TranslateW<CR>", opt)

-- 编译 运行
--map("n", "<F4>", ":call BuildCode()<CR>", opt)
--map("n", "<F5>", ":call RunCode()<CR>", opt)
map("n", "<F5>", ":RunCode<CR>", opt)

map("n", "<F8>", ":TagbarToggle<CR>", opt)

-- Cmake
map("n", "<leader>cn", ":CMake create_project<CR>", opt)
map("n", "<leader>cc", ":CMake configure<CR>", opt)
map("n", "<leader>cs", ":CMake select_target<CR>", opt)
map("n", "<leader>cb", ":CMake build<CR>", opt)
map("n", "<leader>cr", ":CMake run<CR>", opt)


pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_ignored" }, -- Ignore (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}

pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
  -- code action
  mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
  -- go xx
  mapbuf("n", "gd", "<cmd>Lspsaga preview_definition<CR>", opt)
  mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opt)
  mapbuf("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opt)
  -- diagnostic
  mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
  mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
  mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)

  --mapbuf("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opt)
  --mapbuf("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR", opt)
  --mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  --mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
end

pluginKeys.cmp = function(cmp)

  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  return {
    -- 出现补全
    ["<C-j>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    -- 取消
    ["<C-k>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close()
    }),
    -- 上一个
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    ["<C-n>"] = cmp.mapping.select_next_item(),
    -- 确认
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- 如果窗口内容太多，可以滚动
    ["<A-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),

    --["<C-j>"] = cmp.mapping(function(_)
      --if vim.fn["vsnip#available"](1) == 1 then
      --feedkey("<Plug>(vsnip-expand-or-jump)", "")
      --end
      --end, {"i", "s"}),

      --["<C-k>"] = cmp.mapping(function(_)
        --if vim.fn["vsnip#jumpable"](-1) == 1 then
        --feedkey("<Plug>(vsnip-jump-prev)", "")
        --end
        --end, {"i", "s"}),

        -- Super Tab
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          elseif has_words_before() then
            cmp.complete()
          else
            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
          end
        end, {"i", "s"})
        -- end of super Tab
      }
    end

    return pluginKeys
