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
        ty = {
          mason = false,
          settings = {
            ty = {
              inlayHints = {
                variableTypes = false,
                callArgumentNames = true,
              },
            },
          },
        },
        -- pyrefly = {
        --   mason = false,
        -- },
      },
    },
  },
}
