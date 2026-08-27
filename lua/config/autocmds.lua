-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.opt.updatetime = 500

local group = vim.api.nvim_create_augroup("LspAutoHover", { clear = true })

vim.api.nvim_create_autocmd("CursorHold", {
  group = group,
  callback = function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then
      return
    end

    vim.lsp.buf.hover({
      border = "rounded",
      focusable = false,
    })
  end,
})
