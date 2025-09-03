return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        matcher = {
          frecency = true, -- frecency bonus
        },
        sources = {
          files = {
            hidden = true,
          },
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
        win = {
          input = {
            keys = {
              ["<c-h>"] = {
                "toggle_hidden",
                mode = { "n", "i" },
              },
              ["<c-i>"] = {
                "toggle_ignored",
                mode = { "n", "i" },
              },
            },
          },
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
