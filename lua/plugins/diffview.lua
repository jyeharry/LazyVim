local f = require("config.functions")

return {
  "sindrets/diffview.nvim",
  keys = {
    { "<leader>gv", "", desc = "Diffview" },
    {
      "<leader>gvo",
      function()
        f.prompt_command("DiffviewOpen", "Enter git revision to diff: ")
      end,
      desc = "Open",
    },
    { "<leader>gvc", "<cmd>DiffviewClose<CR>", desc = "Close" },
    { "<leader>gve", "<cmd>DiffviewToggleFiles<CR>", desc = "Toggle File Explorer" },
    {
      "<leader>gvf",
      function()
        f.prompt_command("DiffviewFileHistory", "Enter paths to diff and/or --range: ")
      end,
      desc = "File history",
    },
    { "<leader>gvr", "<cmd>DiffviewRefresh<CR>", desc = "Refresh" },
  },
  opts = {
    view = {
      merge_tool = {
        layout = "diff3_mixed",
      },
    },
  },
}
