-- LSPの定義・参照をVSCode風にプレビュー (overlook.nvimから置き換え)
-- gd/gr/gy/gI は LazyVim の LSP キーを上書きするため lsp.lua 側で設定している
return {
  "dnlhc/glance.nvim",
  cmd = "Glance",
  opts = {
    hooks = {
      -- 定義が1件だけならプレビューせずに直接ジャンプ
      before_open = function(results, open, jump, method)
        if method == "definitions" and #results == 1 then
          jump(results[1])
        else
          open(results)
        end
      end,
    },
  },
}
