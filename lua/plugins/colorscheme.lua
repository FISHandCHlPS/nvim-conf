return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = {},
    init = function()
      vim.o.background = "light"
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "soft"
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_better_performance = 1
    end,
  },
}
