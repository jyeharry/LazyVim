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
    keys = {
      { "<leader>/", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      {
        "<leader>fE",
        function()
          Snacks.explorer({ cwd = LazyVim.root() })
        end,
        desc = "Explorer Snacks (root dir)",
      },
      {
        "<leader>fe",
        function()
          Snacks.explorer()
        end,
        desc = "Explorer Snacks (cwd)",
      },
      { "<leader>E", "<leader>fE", desc = "Explorer Snacks (root dir)", remap = true },
      { "<leader>e", "<leader>fe", desc = "Explorer Snacks (cwd)", remap = true },
    },
  },
}
