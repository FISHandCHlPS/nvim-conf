return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "K", false },
            { "gh", vim.lsp.buf.hover, desc = "Hover" },
          },
        },
        pyright = {
          enabled = false,
        },
        pyrefly = {
          mason = false,
        },
      },
    },
  },
}
