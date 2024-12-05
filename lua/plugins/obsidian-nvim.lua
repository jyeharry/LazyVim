local functions = require("config.functions")

return {
  {
    "epwalsh/obsidian.nvim",
    event = { "BufReadPre  */second-brain/*.md" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      {
        "gf",
        function()
          if require("obsidian").util.cursor_on_markdown_link() then
            return "<Cmd>ObsidianFollowLink<CR>"
          else
            return "gf"
          end
        end,
        desc = "Obsidian Follow Link",
      },
      { "<leader>O", "", desc = "Obsidian", mode = { "n", "v" } },
      { "<leader>OD", "<Cmd>ObsidianDailies<CR>", desc = "Dailies" },
      { "<leader>OT", "<Cmd>ObsidianTags<CR>", desc = "Tags" },
      { "<leader>Ob", "<Cmd>ObsidianBacklinks<CR>", desc = "Backlinks" },
      { "<leader>Oc", "<Cmd>ObsidianToggleCheckbox<CR>", desc = "Toggle Checkbox" },
      { "<leader>Od", "<Cmd>ObsidianToday<CR>", desc = "Today" },
      { "<leader>Of", "<Cmd>ObsidianQuickSwitch<CR>", desc = "Find notes" },
      { "<leader>Og", "<Cmd>ObsidianSearch<CR>", desc = "Grep" },
      { "<leader>Oi", "<Cmd>ObsidianPasteImg<CR>", desc = "Paste Image" },
      { "<leader>Ol", "<Cmd>ObsidianLinks<CR>", desc = "Links" },
      { "<leader>On", "<Cmd>ObsidianNew<CR>", desc = "New Note" },
      { "<leader>Oo", "<Cmd>ObsidianOpen<CR>", desc = "Open" },
      { "<leader>Op", "<Cmd>ObsidianTemplate<CR>", desc = "Insert Template" },
      { "<leader>Or", "<Cmd>ObsidianRename<CR>", desc = "Rename" },
      { "<leader>Ot", "<Cmd>ObsidianTomorrow<CR>", desc = "Tomorrow" },
      { "<leader>Oy", "<Cmd>ObsidianYesterday<CR>", desc = "Yesterday" },
      {
        "<leader>Oe",
        function()
          functions.prompt_command(
            "ObsidianExtractNote",
            "Enter title of note to extract to (blank to use selection): ",
            functions.getVisualSelection()
          )
        end,
        "Extract",
        mode = { "v" },
      },
      {
        "<leader>Ol",
        function()
          functions.prompt_command("ObsidianLink", "Enter title of note to link to (blank to use selection): ")
        end,
        "Link",
        mode = { "v" },
      },
      {
        "<leader>On",
        function()
          functions.prompt_command("ObsidianLinkNew", "Enter title of new note (blank to use selection): ")
        end,
        "New Note",
        mode = { "v" },
      },
    },
    opts = {
      dir = vim.env.HOME .. "/second-brain", -- specify the vault location. no need to call 'vim.fn.expand' here
      use_advanced_uri = true,
      finder = "telescope.nvim",
      note_id_func = function(title)
        return title
      end,

      templates = {
        subdir = "templates",
        date_format = "%-d of %B, %Y",
        time_format = "%I:%M%p",
      },

      notes_subdir = "inbox",

      mappings = {
        ["gf"] = {
          action = function()
            if require("obsidian").util.cursor_on_markdown_link() then
              return "<Cmd>ObsidianFollowLink<CR>"
            else
              return "gf"
            end
          end,
          opts = { noremap = false, expr = true, buffer = true },
          desc = "Obsidian Follow Link",
        },
        ["cx"] = {
          action = "<Cmd>ObsidianToggleCheckbox<CR>",
          desc = "Toggle checkbox",
        },
        ["<leader>Ox"] = {
          action = "<Cmd>ObsidianToggleCheckbox<CR>",
          desc = "Toggle checkbox",
        },
      },

      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "daily",
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%Y-%m-%d",
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = "%B %-d, %Y",
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        -- template = 'daily.md',
      },

      note_frontmatter_func = function(note)
        -- This is equivalent to the default frontmatter function.
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }
        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,

      -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
      -- URL it will be ignored but you can customize this behavior here.
      follow_url_func = vim.ui.open,

      ui = {
        checkboxes = {
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
        },
      },
    },
  },
}
