return {
  "folke/sidekick.nvim",
  keys = {
    {
      "<leader>aa",
      function()
        require("sidekick.cli").toggle({ name = "opencode", focus = true })
      end,
      desc = "Sidekick OpenCode Toggle",
    },
    {
      "<c-.>",
      function()
        require("sidekick.cli").toggle({ name = "opencode", focus = true })
      end,
      desc = "Sidekick Toggle",
      mode = { "n", "t", "i", "x" },
    },
    {
      "<leader>aT",
      function()
        require("sidekick.nes").toggle()
      end,
      mode = { "n" },
      desc = "Toggle NES",
    },
    {
      "<leader>au",
      function()
        require("sidekick.nes").update()
      end,
      mode = { "n" },
      desc = "Update NES",
    },
    {
      "<leader>ac",
      function()
        require("sidekick.nes").clear()
      end,
      mode = { "n" },
      desc = "Clear NES",
    },
    {
      "<leader>as",
      function()
        require("sidekick.cli").select({ filter = { installed = true } })
      end,
      desc = "Select CLI",
    },
    {
      "<leader>at",
      function()
        require("sidekick.cli").send({ name = "opencode", msg = "{this}" })
      end,
      mode = { "x", "n" },
      desc = "Send This",
    },
    {
      "<leader>af",
      function()
        require("sidekick.cli").send({ name = "opencode", msg = "{file}" })
      end,
      desc = "Send File",
    },
    {
      "<leader>av",
      function()
        require("sidekick.cli").send({ name = "opencode", msg = "{selection}" })
      end,
      mode = { "x" },
      desc = "Send Visual Selection",
    },
  },
}
