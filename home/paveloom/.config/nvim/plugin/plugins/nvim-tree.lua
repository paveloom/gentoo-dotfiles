vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

vim.keymap.set("n", "<leader>w", function()
  require("nvim-tree.api").tree.toggle({ find_file = true })
end)
