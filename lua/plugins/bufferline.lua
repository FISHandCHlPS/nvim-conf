return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<A-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<A-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },

      -- LazyVim デフォルトの Shift+h/l を無効化
      { "<S-h>", false },
      { "<S-l>", false },
    },
  },
}
