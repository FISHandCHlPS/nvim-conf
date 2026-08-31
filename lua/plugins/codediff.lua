return {
  {
    "esmuellert/codediff.nvim",
    cmd = "CodeDiff",

    keys = {
      {
        "<leader>gd",
        "<cmd>CodeDiff<cr>",
        desc = "CodeDiff Changes",
      },
      {
        "<leader>gD",
        "<cmd>CodeDiff main...<cr>",
        desc = "CodeDiff vs main",
      },
    },

    opts = {
      keymaps = {
        view = {
          toggle_explorer = "<Tab>",
          next_hunk = "]",
          prev_hunk = "[",
        },
      },

      diff = {
        layout = "inline",
      },

      explorer = {
        position = "bottom",
        height = 10,
        view_mode = "tree",
        flatten_dirs = true,
        auto_refresh = true,
        initial_focus = "explorer",
      },
    },
  },
}
