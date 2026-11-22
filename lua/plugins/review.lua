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

    -- review.nvim は r (レビュー済みにして次へ) を差分の欄にしか設定せず、
    -- ファイル切り替え直後もキーを張り直す間 (約100ms) は未設定になる。
    -- その間に押すと Vim 本来の r (1文字置換) になってしまうので、
    -- codediff の画面に表示されたバッファへ代わりの r を先に設定しておく。
    -- review.nvim 自身の r が設定されたらそちらで上書きされる。
    local function toggle_reviewed_fallback()
      local tabpage = vim.api.nvim_get_current_tabpage()
      local ok_cd, lifecycle = pcall(require, "codediff.ui.lifecycle")
      local ok_cfg, review_config = pcall(require, "review.config")
      local in_review = ok_cd
        and ok_cfg
        and lifecycle.get_session(tabpage)
        and review_config.get().codediff.readonly
      if not in_review then
        -- review 外や編集モードでは本来の r として動かす
        vim.api.nvim_feedkeys((vim.v.count > 0 and vim.v.count or "") .. "r", "n", false)
        return
      end
      local explorer = require("review.hooks").get_explorer(tabpage)
      if explorer then
        require("review.reviewed").toggle_current(explorer)
      end
    end

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
      group = vim.api.nvim_create_augroup("review_toggle_fallback", { clear = true }),
      callback = function(ev)
        if vim.api.nvim_win_get_config(0).relative ~= "" then
          return
        end
        local ok_cd, lifecycle = pcall(require, "codediff.ui.lifecycle")
        if not (ok_cd and lifecycle.get_session(vim.api.nvim_get_current_tabpage())) then
          return
        end
        for _, map in ipairs(vim.api.nvim_buf_get_keymap(ev.buf, "n")) do
          if map.lhs == "r" then
            return -- review.nvim の r が既にある
          end
        end
        vim.keymap.set("n", "r", toggle_reviewed_fallback, {
          buffer = ev.buf,
          nowait = true,
          desc = "Toggle file reviewed (fallback)",
        })
      end,
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
