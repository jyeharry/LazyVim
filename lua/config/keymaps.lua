-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Better buffer cycling and deleting
map("n", "<C-c>", function()
  Snacks.bufdelete()
end, { desc = "Delete buffer" })
map("n", "<C-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<C-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

map({ "n", "o", "v" }, "H", "^", { desc = "Beginning of line" })
map({ "n", "o", "v" }, "L", "$", { desc = "End of line" })

map("n", "p", "p=`]", { desc = "Paste and match indentation" })
map("n", "P", "P=`]", { desc = "Paste before and match indentation" })

map("n", "U", "<C-r>", { desc = "Redo" })

local wk = require("which-key")
wk.add({
  {
    "<leader>y",
    group = "Yank",
    { "<leader>ya", "<cmd>let @+=expand('%:p')<CR>:echo 'Copied absolute path'<CR>", desc = "Absolute Path" },
    { "<leader>yr", "<cmd>let @+=expand('%:.')<CR>:echo 'Copied relative path'<CR>", desc = "Relative Path" },
    { "<leader>yd", "<cmd>let @+=expand('%:h:t')<CR>:echo 'Copied directory name'<CR>", desc = "Directory Name" },
    { "<leader>yf", "<cmd>let @+=expand('%:t')<CR>:echo 'Copied filename'<CR>", desc = "Filename" },
  },
})

vim.keymap.del("n", "n")
vim.keymap.del("x", "n")
vim.keymap.del("o", "n")
vim.keymap.del("n", "N")
vim.keymap.del("x", "N")
vim.keymap.del("o", "N")
