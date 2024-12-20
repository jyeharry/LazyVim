return {
  {
    "williamboman/mason.nvim",
    optional = true,
    opts = {
      ensure_installed = {
        "bash-language-server",
        "bash-debug-adapter",
        "shellcheck",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = {
      ensure_installed = {
        "bash",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = {
      ensure_installed = {
        { "bashls" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        bash = { "bash" },
        zsh = { "zsh" },
        shellcheck = { "shellcheck" },
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = {
      ensure_installed = {
        "bash",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        sh = { "shfmt" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        bashls = function(_, opts)
          -- Add an autocmd to set the filetype for `.myzshrc`
          vim.api.nvim_create_autocmd("BufEnter", {
            pattern = ".myzshrc",
            callback = function()
              vim.bo.filetype = "sh"
            end,
          })
          return opts
        end,
      },
    },
  },
}
