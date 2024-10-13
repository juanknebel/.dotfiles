return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
        "rust",
        "python",
        "java",
        "c",
        "cpp",
        "javascript",
        "typescript",
        "bash",
        "fish",
        "bibtex",
        "latex",
        "mermaid",
        "sql",
        "dockerfile",
        "json",
        "json5",
        "xml",
        "toml",
        "yaml",
        "markdown",
        "cmake",
        "make",
        "csv",
        "tsv",
        "diff",
        "hurl",
        "kdl",
        "proto",
      },
    },
  },
}
