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
          -- nowait付きのバッファローカルなので1打で即反応する
          next_hunk = ">",
          prev_hunk = "<",
          -- review.nvimの<Tab>(未レビューのファイルへ)と同じキーにしておく。
          -- review.nvimはファイル一覧の欄には<Tab>を設定せず、ファイル切り替え直後も
          -- キーを張り直す間(約100ms)は未設定になるので、その間はcodediff側が受け止める
          next_file = "<Tab>",
          prev_file = "<S-Tab>",
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
        -- ファイル一覧の欄ではreview.nvimのキーが効かないので、差分の欄から始める
        initial_focus = "modified",
      },
    },
  },
}
