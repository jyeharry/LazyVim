return {
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          LazyVim.on_load("telescope.nvim", function()
            require("telescope").load_extension("live_grep_args")
          end)
        end,
      },
    },
    opts = {
      extensions = {
        live_grep_args = {
          mappings = {
            i = {
              ["<C-o>"] = function(picker)
                require("telescope-live-grep-args.actions").quote_prompt()(picker)
              end,
            },
          },
        },
      },
    },
    keys = {
      {
        "<leader>fg",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Grep",
      },
      { "<leader>fR", "<cmd>Telescope resume<cr>", desc = "Resume Find" },
      { "<leader>fH", "<cmd>Telescope pickers<cr>", desc = "Telescope history" },
    },
  },
}
