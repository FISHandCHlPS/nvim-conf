return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "K", false },
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
