-- シンボル検索・ジャンプ
-- LSPバッファの <leader>ss は lsp.lua 側でも namu に上書きしている
return {
  "bassamsdata/namu.nvim",
  cmd = "Namu",
  main = "namu",
  init = function()
    -- 挿入モードの jk でも即閉じる
    -- (keymaps.lua の jk -> <Esc> は noremap なので namu の <Esc>=閉じる が効かず、挿入モードを抜けるだけになるため)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "namu_prompt",
      callback = function(args)
        vim.keymap.set("i", "jk", "<Esc>", { buffer = args.buf, remap = true, desc = "Namu: Close" })
      end,
    })
  end,
  opts = {
    global = {
      -- ; は ":" マップと被るので C-g に変更
      jump = { toggle_key = "<C-g>" },
      -- C-n/p の代わりに C-j/k で移動
      movement = {
        next = { "<C-j>", "<Down>" },
        previous = { "<C-k>", "<Up>" },
      },
    },
  },
  keys = {
    { "<leader>ss", "<cmd>Namu symbols<cr>", desc = "Namu symbols" },
  },
}
