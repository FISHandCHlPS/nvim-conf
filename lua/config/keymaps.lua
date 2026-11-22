-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Insert mode: jk  -> Esc
vim.keymap.set("i", "jk", "<Esc>", {
  noremap = true,
  silent = true,
  desc = "Exit insert mode",
})

-- accelerated-jk: j/k長押しで加速 (カウントなしは折り返し行単位のgj/gk、カウント付きは通常のj/k)
vim.keymap.set("n", "j", function()
  return vim.v.count == 0 and "<Plug>(accelerated_jk_gj)" or "j"
end, { expr = true, remap = true, silent = true, desc = "Down" })
vim.keymap.set("n", "k", function()
  return vim.v.count == 0 and "<Plug>(accelerated_jk_gk)" or "k"
end, { expr = true, remap = true, silent = true, desc = "Up" })

-- shift + h/j/k/l で高速化
vim.keymap.set("n", "J", "6j", { desc = "Down 6 lines" })
vim.keymap.set("n", "K", "6k", { desc = "Up 6 lines" })

-- C-d / C-u で半ページスクロール
vim.keymap.set("n", "<C-d>", function()
  local n = math.floor(vim.api.nvim_win_get_height(0) / 2)
  return n .. "<C-e>"
end, { expr = true })

vim.keymap.set("n", "<C-u>", function()
  local n = math.floor(vim.api.nvim_win_get_height(0) / 2)
  return n .. "<C-y>"
end, { expr = true })

-- ;でコマンド
vim.keymap.set("n", ";", ":", { desc = "Enter command-line" })

-- lsp参照へジャンプ
vim.keymap.set("n", "gn", function()
  Snacks.words.jump(vim.v.count1, true)
end, { desc = "Next Reference" })

vim.keymap.set("n", "gp", function()
  Snacks.words.jump(-vim.v.count1, true)
end, { desc = "Previous Reference" })

-- ターミナルをleader+@で出す
vim.keymap.set({ "n", "t" }, "<leader>@", function()
  Snacks.terminal.focus(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })

-- [x / ]x を <x / >x でも使えるようにする (元の [ ] 版も残す)
-- remap で既存の [x / ]x を呼ぶので、gitsigns や treesitter のバッファローカルなキーにも効く
-- ビジュアル/オペレータ待ちモードは < > (インデント) が待たされるため normal のみ
local bracket_keys = {
  { "B", "Move Buffer" },
  { "d", "Diagnostic" },
  { "e", "Error" },
  { "w", "Warning" },
  { "h", "Hunk" },
  { "f", "Function Start" },
  { "c", "Class Start" },
  { "a", "Parameter Start" },
  { "q", "Trouble/Quickfix Item" },
  { "t", "Todo Comment" },
  { "i", "Scope Edge" },
  { "<Space>", "Add Empty Line Above", "Add Empty Line Below" },
}
for _, k in ipairs(bracket_keys) do
  local key, prev_desc, next_desc = k[1], k[3] and k[2] or "Prev " .. k[2], k[3] or "Next " .. k[2]
  vim.keymap.set("n", "<lt>" .. key, "[" .. key, { remap = true, desc = prev_desc })
  vim.keymap.set("n", ">" .. key, "]" .. key, { remap = true, desc = next_desc })
end

-- tabとshift+tabでインデント
-- review.nvimとキーが衝突するためVisual modeのみ
vim.keymap.set("x", "<Tab>", ">gv", { desc = "Indent selection" })
vim.keymap.set("x", "<S-Tab>", "<gv", { desc = "Unindent selection" })

-- Delete / change without overwriting registers
vim.keymap.set({ "n", "x" }, "d", '"_d')
vim.keymap.set({ "n", "x" }, "D", '"_D')
vim.keymap.set({ "n", "x" }, "c", '"_c')
vim.keymap.set("n", "C", '"_C')

-- Ctrl+/ -> Comment
vim.keymap.set("n", "<C-/>", "gcc", {
  remap = true,
  desc = "Toggle Comment",
})

vim.keymap.set("x", "<C-/>", "gc", {
  remap = true,
  desc = "Toggle Comment",
})

-- Ctrl+/ が Ctrl+_ として届く terminal 対策
vim.keymap.set("n", "<C-_>", "gcc", {
  remap = true,
  desc = "Toggle Comment",
})

vim.keymap.set("x", "<C-_>", "gc", {
  remap = true,
  desc = "Toggle Comment",
})
