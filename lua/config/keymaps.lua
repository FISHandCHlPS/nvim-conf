-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Insert mode: jj -> Esc
vim.keymap.set("i", "jj", "<Esc>", {
  noremap = true,
  silent = true,
  desc = "Exit insert mode",
})

-- shift + h/j/k/l で高速化
vim.keymap.set("n", "J", "6j", { desc = "Down 6 lines" })
vim.keymap.set("n", "K", "6k", { desc = "Up 6 lines" })
-- spiderに変更
-- vim.keymap.set("n", "H", "b", { desc = "Previous word" })
-- vim.keymap.set("n", "L", "w", { desc = "Next word" })

-- ;でコマンド
vim.keymap.set("n", ";", ":", { desc = "Enter command-line" })

-- ターミナルをleader+@で出す
vim.keymap.set({ "n", "t" }, "<leader>@", function()
  Snacks.terminal.focus(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })

-- tabとshift+tabでインデント
-- Normal mode: current line
vim.keymap.set("n", "<Tab>", ">>", { desc = "Indent line" })
vim.keymap.set("n", "<S-Tab>", "<<", { desc = "Unindent line" })
-- Visual mode: selection
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
