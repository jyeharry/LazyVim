return {
  {
    "max397574/better-escape.nvim",
    version = "v1.0.0",
    config = function()
      require("better_escape").setup({
        mapping = { "jk", "kj", "JK", "KJ" },
      })
    end,
  },
}
