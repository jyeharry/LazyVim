return {
  {
    "olimorris/codecompanion.nvim",
    enabled = true,
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "codecompanion" },
        },
        ft = { "markdown", "codecompanion" },
      },
      {
        "folke/which-key.nvim",
        opts = {
          spec = {
            {
              mode = { "n", "v" },
              { "<leader>a", group = "ai" },
            },
          },
        },
      },
    },
    opts = {
      adapters = {
        opts = {
          show_defaults = true,
        },
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            schema = {
              model = {
                default = "claude-sonnet-4-20250514",
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "anthropic",
        },
        inline = {
          adapter = "anthropic",
          keymaps = {
            accept_change = {
              modes = { n = "ga" },
              description = "Accept the suggested change",
            },
            reject_change = {
              modes = { n = "gr" },
              description = "Reject the suggested change",
            },
          },
        },
        cmd = {
          adapter = "anthropic",
        },
      },
      display = {
        action_palette = {
          provider = "snacks",
        },
      },
    },
    keys = {
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "Actions" },
      { "<leader>ac", mode = { "n" }, "<cmd>CodeCompanionChat Toggle<cr>", desc = "Chat" },
      { "<leader>ac", mode = { "v" }, "<cmd>CodeCompanionChat Add<cr>", desc = "Add to chat buffer" },
      { "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "Inline assistant" },
    },
  },
}
