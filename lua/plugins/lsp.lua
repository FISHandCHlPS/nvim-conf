return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "K", false },
            -- { "gh", vim.lsp.buf.hover, desc = "Hover" },
            {
              "gh",
              function()
                require("utils.translated_hover").hover()
              end,
              desc = "Hover + Translate",
              has = "hover",
            },
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
