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
            row = 10,
            col = "100%",
          },

          size = {
            width = 40,
            height = "auto",
            max_height = 7,
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
