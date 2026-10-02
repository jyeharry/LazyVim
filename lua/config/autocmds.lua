-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local functions = require("config.functions")
local wk = require("which-key")

local root_augroup = vim.api.nvim_create_augroup("MyAutoRoot", {})
vim.api.nvim_create_autocmd("BufEnter", { group = root_augroup, callback = functions.set_root })

-- Fuzzy document outline (TOC) in the snacks picker.
-- Each provider populates the loclist and opens it, same as the built-in `gO`.
-- We dispatch per filetype rather than feeding `gO`, because nvim rebinds `gO`
-- to the async `vim.lsp.buf.document_symbol()` on LspAttach.
local toc_providers = {
  man = function()
    require("man").show_toc()
  end,
  help = function()
    require("vim.treesitter._headings").show_toc()
  end,
  markdown = function()
    require("vim.treesitter._headings").show_toc()
  end,
  checkhealth = function()
    require("vim.treesitter._headings").show_toc(6)
  end,
}

local function attach_toc(buf)
  if not vim.api.nvim_buf_is_valid(buf) then
    return
  end
  local provider = toc_providers[vim.bo[buf].filetype]
  if not provider then
    return
  end
  wk.add({
    {
      "<leader>sO",
      function()
        provider()
        vim.cmd("lclose") -- hide the plain loclist window
        Snacks.picker.loclist({ formatters = { file = { filename_only = true } } })
      end,
      desc = "Outline (TOC)",
      icon = "󰗚",
      buffer = buf,
    },
  })
end

local toc_augroup = vim.api.nvim_create_augroup("MyDocToc", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = toc_augroup,
  pattern = vim.tbl_keys(toc_providers),
  callback = function(ev)
    attach_toc(ev.buf)
  end,
})

-- Retro-attach to buffers whose FileType already fired before this file loaded,
-- e.g. MANPAGER='nvim +Man!', where the man buffer exists before VeryLazy.
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.api.nvim_buf_is_loaded(buf) then
    attach_toc(buf)
  end
end
