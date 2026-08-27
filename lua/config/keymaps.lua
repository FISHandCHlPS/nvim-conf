-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Insert mode: jj -> Esc
vim.keymap.set("i", "jj", "<Esc>", {
  noremap = true,
  silent = true,
  desc = "Exit insert mode",
})

vim.keymap.set("n", "J", "6j", { desc = "Down 6 lines" })
vim.keymap.set("n", "K", "6k", { desc = "Up 6 lines" })
-- vim.keymap.set("n", "H", "b", { desc = "Previous word" })
-- vim.keymap.set("n", "L", "w", { desc = "Next word" })

vim.keymap.set("n", "+", ":", { desc = "Enter command-line" })

-- vim.keymap.set({ "n", "x", "o" }, "H", "<Nop>")
-- vim.keymap.set({ "n", "x", "o" }, "L", "<Nop>")
