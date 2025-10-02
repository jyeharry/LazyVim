return {
  "folke/sidekick.nvim",
  -- stylua: ignore
  keys = {
    {
      "<leader>aa",
      function() require("sidekick.cli").toggle({ name = "opencode", focus = true }) end,
      desc = "Sidekick OpenCode Toggle",
    },
    -- Example of a keybinding to open Claude directly
    -- (included from folke, not for me)
    { "<leader>ac", false },
  },
}
