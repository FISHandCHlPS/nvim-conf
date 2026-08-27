return {
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        hover = {
          enabled = true,
          view = "lsp_hover_top_right",
        },
      },

      views = {
        lsp_hover_top_right = {
          backend = "popup",
          relative = "editor",

          position = {
            row = 1,
            col = "100%",
          },

          size = {
            width = 50,
            height = "auto",
            max_height = 20,
          },

          border = {
            style = "rounded",
          },

          win_options = {
            wrap = true,
          },
        },
      },
    },
  },
}
