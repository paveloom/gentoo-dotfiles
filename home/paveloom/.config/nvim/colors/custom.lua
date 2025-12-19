-- Code in this file is run as part of the `vim.cmd.colorscheme("custom")` call

require("mini.hues").setup({
  background = "#ffffff",
  foreground = "#3b413c",
  saturation = "high",
  accent = "fg",
})

-- Identify the created highlight groups with this name
vim.g.colors_name = "custom"
