if true then
  return {}
end
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruby_lsp = {
        mason = false,
        cmd = { vim.fn.expand("~/.local/share/mise/shims/ruby-lsp") },
      },
      rubocop = {
        mason = false,
        cmd = { vim.fn.expand("~/.local/share/mise/shims/rubocop"), "--lsp" },
      },
    },
  },
}
