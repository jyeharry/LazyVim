local f = require("config.functions")

return {
  "sindrets/diffview.nvim",
  keys = {
    { "<leader>gD", "", desc = "Diffview" },
    {
      "<leader>gDo",
      function()
        f.prompt_command("DiffviewOpen", "Enter git revision to diff: ")
      end,
      desc = "Open",
    },
    { "<leader>gDc", "<cmd>DiffviewClose<CR>", desc = "Close" },
    { "<leader>gDe", "<cmd>DiffviewToggleFiles<CR>", desc = "Toggle File Explorer" },
    {
      "<leader>gDf",
      function()
        f.prompt_command("DiffviewFileHistory", "Enter paths to diff and/or --range: ")
      end,
      desc = "File history",
    },
    { "<leader>gDr", "<cmd>DiffviewRefresh<CR>", desc = "Refresh" },
  },
  opts = {
    view = {
      merge_tool = {
        layout = "diff3_mixed",
      },
    },
  },
}
