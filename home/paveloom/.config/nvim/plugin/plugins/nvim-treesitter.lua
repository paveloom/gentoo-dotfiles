---@diagnostic disable: missing-fields
require("nvim-treesitter.configs").setup({
  auto_install = true,
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
})

require("nvim-treesitter-textobjects").setup({
  select = {
    lookahead = true
  }
})

local select = require("nvim-treesitter-textobjects.select")
local function select_textobject(query_string)
  select.select_textobject(query_string, "textobjects")
end

local mode = { "x", "o" }
vim.keymap.set(mode, "af", function()
  select_textobject("@function.outer")
end)
vim.keymap.set(mode, "if", function()
  select_textobject("@function.inner")
end)
vim.keymap.set(mode, "aa", function()
  select_textobject("@parameter.outer")
end)
vim.keymap.set(mode, "ia", function()
  select_textobject("@parameter.inner")
end)
