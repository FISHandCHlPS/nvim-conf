return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = {
    { "nvim-mini/mini.icons", opts = {} },
  },
  opts = {
    default_file_explorer = true,

    columns = {
      "icon",
    },

    delete_to_trash = true,

    skip_confirm_for_simple_edits = false,

    view_options = {
      show_hidden = true,
    },

    keymaps = {
      ["<CR>"] = "actions.select",
      ["<C-h>"] = false,
      ["<C-l>"] = false,
      ["<C-s>"] = false,
      ["-"] = "actions.parent",
      ["g."] = "actions.toggle_hidden",
      ["q"] = {
        "actions.close",
        mode = "n",
      },
    },
  },

  keys = {
    {
      "-",
      "<cmd>Oil<CR>",
      desc = "Open parent directory",
    },
  },
}
