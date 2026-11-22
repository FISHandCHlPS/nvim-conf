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
          toggle_explorer = "f",
          next_hunk = ">h",
          prev_hunk = "<h",
        },
      },

      diff = {
        layout = "inline",
        original_position = "right",
      },

      explorer = {
        position = "left",
        width = 25,
        view_mode = "tree",
        flatten_dirs = true,
        auto_refresh = true,
        initial_focus = "explorer",
      },
    },
  },
}
