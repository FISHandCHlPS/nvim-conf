-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- スクロール開始位置の開始位置を設定
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 15

-- 行番号を非表示
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.foldcolumn = "0"

-- 折り返して表示
vim.opt.wrap = true

-- クリップボードを日本語入力対応
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}

vim.opt.clipboard = "unnamedplus"
