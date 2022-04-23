-- 主题列表
--
-- tokyonight
-- oceanic
-- gruvbox
-- nord
-- onedark
-- nightfox

local colorscheme = "tokyonight"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("没有主题 " .. colorscheme)
  vim.cmd [[
  colorscheme default
  set background=dark
  ]]
  return
end

vim.cmd [[
highlight Normal guibg=NONE ctermbg=None
]]

-- 吸血鬼主题
--use {
  --'dracula/vim',
  --as = 'dracula'
  --}

  --use 'glepnir/zephyr-nvim'

  -- OceanicNext
  --use 'mhartington/oceanic-next'

  -- gruvbox
  --use {
    --'ellisonleao/gruvbox.nvim',
    --requires = 'rktjmp/lush.nvim'
    --}

    -- nord
    --use 'shaunsingh/nord.nvim'

    -- onedark
    --use 'ful1e5/onedark.nvim'

    -- nightfox
    --use 'EdenEast/nightfox.nvim'
