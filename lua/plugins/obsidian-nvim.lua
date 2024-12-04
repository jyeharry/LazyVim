local functions = require("config.functions")

if true then
  return {}
end
return {
  {
    "epwalsh/obsidian.nvim",
    -- the obsidian vault in this default config  ~/obsidian-vault
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
    -- event = { "bufreadpre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
    event = { "BufReadPre  */obsidian-vault/*.md" },
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
      -- ["<leader>O"] = {
      --   name = "Obsidian",
      { "D", "<Cmd>ObsidianDailies<CR>", desc = "Dailies" },
      { "T", "<Cmd>ObsidianTags<CR>", desc = "Tags" },
      { "b", "<Cmd>ObsidianBacklinks<CR>", desc = "Backlinks" },
      { "c", "<Cmd>ObsidianToggleCheckbox<CR>", desc = "Toggle Checkbox" },
      { "d", "<Cmd>ObsidianToday<CR>", desc = "Today" },
      { "f", "<Cmd>ObsidianQuickSwitch<CR>", desc = "Find notes" },
      { "g", "<Cmd>ObsidianSearch<CR>", desc = "Grep" },
      { "i", "<Cmd>ObsidianPasteImg<CR>", desc = "Paste Image" },
      { "l", "<Cmd>ObsidianLinks<CR>", desc = "Links" },
      { "n", "<Cmd>ObsidianNew<CR>", desc = "New Note" },
      { "o", "<Cmd>ObsidianOpen<CR>", desc = "Open" },
      { "p", "<Cmd>ObsidianTemplate<CR>", desc = "Insert Template" },
      { "r", "<Cmd>ObsidianRename<CR>", desc = "Rename" },
      { "t", "<Cmd>ObsidianTomorrow<CR>", desc = "Tomorrow" },
      { "y", "<Cmd>ObsidianYesterday<CR>", desc = "Yesterday" },
      -- },
    },
    opts = {
      dir = vim.env.HOME .. "/obsidian-vault", -- specify the vault location. no need to call 'vim.fn.expand' here
      use_advanced_uri = true,
      finder = "telescope.nvim",

      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
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
    },
  },
}
