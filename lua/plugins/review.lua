return {
  "georgeguimaraes/review.nvim",
  version = "*",
  dependencies = {
    "esmuellert/codediff.nvim",
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",

  init = function()
    local function set_review_highlights()
      vim.api.nvim_set_hl(0, "ReviewNoteLine", {
        link = "CursorLine",
      })

      vim.api.nvim_set_hl(0, "ReviewSuggestionLine", {
        link = "DiffAdd",
      })

      vim.api.nvim_set_hl(0, "ReviewIssueLine", {
        link = "DiffChange",
      })

      vim.api.nvim_set_hl(0, "ReviewPraiseLine", {
        link = "DiffAdd",
      })
    end

    set_review_highlights()

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_review_highlights,
    })
  end,

  keys = {
    { "<leader>rr", "<cmd>Review<cr>", desc = "Review working tree" },
    { "<leader>rc", "<cmd>Review commits<cr>", desc = "Review commits" },
    { "<leader>rb", "<cmd>Review branch<cr>", desc = "Review branch" },
    { "<leader>rn", ":Review note<cr>", mode = { "n", "v" }, desc = "Review: note here" },
    { "<leader>re", "<cmd>Review edit<cr>", desc = "Review: edit comment" },
    { "<leader>rd", "<cmd>Review delete<cr>", desc = "Review: delete comment" },
    { "<leader>rx", "<cmd>Review export<cr>", desc = "Review: export" },
  },
  opts = {},
}
