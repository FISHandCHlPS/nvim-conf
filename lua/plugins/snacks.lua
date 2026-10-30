return {
  "folke/snacks.nvim",
  opts = {
    indent = { enabled = false },

    keys = {
      { "<leader>gd", false },
      { "<leader>gD", false },
    },

    picker = {
      -- Ctrl+h/lでウィンドウを切り替え
      win = {
        input = {
          keys = {
            ["<C-l>"] = { "cycle_win", mode = { "i", "n" } },
          },
        },
        list = {
          keys = {
            ["<C-l"] = "cycle_win",
          },
        },
        preview = {
          keys = {
            ["<C-h>"] = "cycle_win",
          },
        },
      },

      -- ツリーを右に表示
      sources = {
        explorer = {
          layout = {
            layout = {
              position = "right",
            },
          },
        },
        lsp_workspace_symbols = {
          transform = function(item)
            local path = (item.file or ""):gsub("\\", "/")

            if path:match("^%.venv/") or path:match("/%.venv/") then
              return false
            end

            return item
          end,
        },
      },

      layouts = {
        default = {
          layout = {
            box = "horizontal",
            width = 0.95,
            height = 0.9,
            {
              box = "vertical",
              width = 0.3,
              border = "rounded",
              title = "{title} {live} {flags}",
              title_pos = "center",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
            {
              win = "preview",
              border = "rounded",
            },
          },
        },
      },
    },
  },
}
