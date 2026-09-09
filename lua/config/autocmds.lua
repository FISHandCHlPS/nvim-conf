-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.opt.updatetime = 1000

local function set_highlights()

local function set_lsp_reference_highlights()
  local reference = {
    bg = "#d3d5b8",
    underline = true,
  }

  for group, opts in pairs({
    LspInlayHint = { fg = "#a89984", italic = true },
    LspReferenceText = reference,
    LspReferenceRead = reference,
    LspReferenceWrite = {
      bg = "#f7d9b9",
      fg = "#c14a4a",
      bold = true,
      underline = true,
    },
  }) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

set_highlights()
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_highlights })
