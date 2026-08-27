return {
  {
    "chrisgrieser/nvim-spider",
    lazy = false,
    keys = {
      {
        "<S-l>",
        function()
          require("spider").motion("w")
        end,
        mode = { "n", "o", "x" },
        desc = "Smart word forward",
      },
      {
        "<S-h>",
        function()
          require("spider").motion("b")
        end,
        mode = { "n", "o", "x" },
        desc = "Smart word backward",
      },
    },
  },
}
