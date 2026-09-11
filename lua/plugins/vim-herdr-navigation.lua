return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
  config = function()
    dofile(vim.fn.expand("~/.herdr/plugins/vim-herdr-navigation/editor/nvim.lua"))
  end,
}
