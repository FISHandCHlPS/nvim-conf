return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "K", false },
            { "gh", vim.lsp.buf.hover, desc = "Hover" },
            -- snacks picker の LSP Symbols を namu に置き換え
            { "<leader>ss", "<cmd>Namu symbols<cr>", desc = "Namu symbols" },
            -- 定義・参照ジャンプを glance に置き換え
            { "gd", "<cmd>Glance definitions<cr>", desc = "Goto Definition (Glance)", has = "definition" },
            { "gr", "<cmd>Glance references<cr>", desc = "References (Glance)", nowait = true },
            { "gy", "<cmd>Glance type_definitions<cr>", desc = "Goto Type Definition (Glance)" },
            { "gI", "<cmd>Glance implementations<cr>", desc = "Goto Implementation (Glance)" },
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
