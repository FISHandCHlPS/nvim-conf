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
local clip = "/mnt/c/Windows/System32/clip.exe"
local powershell = "/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"

vim.g.clipboard = {
  name = "WSLClipboard",
  copy = {
    ["+"] = clip,
    ["*"] = clip,
  },
  paste = {
    ["+"] = {
      powershell,
      "-NoLogo",
      "-NoProfile",
      "-Command",
      "[Console]::Out.Write((Get-Clipboard -Raw).ToString().Replace([char]13, ''))",
    },
    ["*"] = {
      powershell,
      "-NoLogo",
      "-NoProfile",
      "-Command",
      "[Console]::Out.Write((Get-Clipboard -Raw).ToString().Replace([char]13, ''))",
    },
  },
  cache_enabled = 0,
}

vim.opt.clipboard = "unnamedplus"
