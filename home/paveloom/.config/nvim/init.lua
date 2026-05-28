vim.pack.add({
  {
    src = "https://github.com/Darazaki/indent-o-matic",
    version = "764da1f"
  },
  {
    src = "https://github.com/folke/snacks.nvim",
    version = vim.version.range("^2")
  },
  {
    src = "https://github.com/j-hui/fidget.nvim",
    version = vim.version.range("^1")
  },
  {
    src = "https://github.com/kylechui/nvim-surround",
    version = vim.version.range("^4")
  },
  {
    src = "https://github.com/lewis6991/gitsigns.nvim",
    version = vim.version.range("^2")
  },
  {
    src = "https://github.com/linrongbin16/gitlinker.nvim",
    version = vim.version.range("^5")
  },
  {
    src = "https://github.com/neovim/nvim-lspconfig",
    version = vim.version.range("^2")
  },
  {
    src = "https://github.com/nvim-mini/mini.hipatterns",
    version = vim.version.range("^0.17")
  },
  {
    src = "https://github.com/nvim-tree/nvim-tree.lua",
    version = vim.version.range("^1")
  },
  {
    src = "https://github.com/nvim-tree/nvim-web-devicons",
    version = vim.version.range("v0.100")
  },
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    version = "851e865"
  },
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("^1")
  }
})

-- Allow project-local configuration
vim.opt.exrc = true
