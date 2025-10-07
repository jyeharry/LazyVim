return {
  "folke/sidekick.nvim",
  -- stylua: ignore
  keys = {
    {
      "<leader>aa",
      function() require("sidekick.cli").toggle({ name = "opencode", focus = true }) end,
      desc = "Sidekick OpenCode Toggle",
    },
    {
      "<leader>aT",
      function() require("sidekick.nes").toggle() end,
      mode = { "n" },
      desc = "Toggle NES",
    },
    {
      "<leader>au",
      function() require("sidekick.nes").update() end,
      mode = { "n" },
      desc = "Update NES",
    },
    {
      "<leader>ac",
      function() require("sidekick.nes").clear() end,
      mode = { "n" },
      desc = "Clear NES",
    },
  },
}
