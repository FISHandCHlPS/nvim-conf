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
          settings = {
            ty = {
              diagnosticMode = "off",
              showSyntaxErrors = false,
              inlayHints = {
                variableTypes = false,
                callArgumentNames = false,
              },
            },
          },
        },
        pyrefly = {
          mason = false,
          settings = {
            pyrefly = {
              inlayHints = {
                variableTypes = false,
                callArgumentNames = true,
              },
            },
          },
        },
      },
    },
  },
}
