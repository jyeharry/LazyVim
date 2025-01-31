return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        matcher = {
          frecency = true, -- frecency bonus
        },
      },
      scroll = {
        animate = {
          duration = { step = 10, total = 100 },
        },
      },
    },
  },
}
