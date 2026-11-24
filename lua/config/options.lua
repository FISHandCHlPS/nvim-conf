-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- スクロール開始位置の開始位置を設定
-- vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 10

-- 行番号を表示
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.foldcolumn = "0"
vim.opt.numberwidth = 3

-- 折り返して表示
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- 日本語（マルチバイト文字）の間でも gq / textwidth で改行できるようにする
vim.opt.formatoptions:append("mM")

-- クリップボードを日本語入力対応
function MyPaste(_)
  return function(_)
    local content = vim.fn.getreg('"')
    return vim.split(content, '\n')
  end
end

if (os.getenv('SSH_TTY') == nil) then
else
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = MyPaste('+'),
      ['*'] = MyPaste('*'),
    },
  }
end
-- vim.g.clipboard = {
--   name = "OSC 52",
--   copy = {
--     ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
--     ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
--   },
--   paste = {
--     ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
--     ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
--   },
-- }

vim.opt.clipboard = "unnamedplus"
