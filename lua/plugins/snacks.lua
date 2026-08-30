return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      -- tabでウィンドウを切り替え
      win = {
        input = {
          keys = {
            ["<Tab>"] = { "cycle_win", mode = { "i", "n" } },
          },
        },
        list = {
          keys = {
            ["<Tab>"] = "cycle_win",
          },
        },
        preview = {
          keys = {
            ["<Tab>"] = "cycle_win",
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
      },

      layout = {
        preset = function()
          local width = vim.api.nvim_win_get_width(0)

          if width >= 110 then
            return "default"
          end

          return "vertical"
        end,
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
