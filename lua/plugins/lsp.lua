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
          enabled = false,
        },

        pyrefly = {
          settings = {
            python = {
              analysis = {
                inlayHints = {
                  variableTypes = false,
                  functionReturnTypes = true,
                },
              },
            },
          },
        },
      },
    },
  },
}
