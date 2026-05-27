local nvim_treesitter = require("nvim-treesitter")

nvim_treesitter.install({ "c", "lua", "markdown", "query", "vim", "vimdoc" })

vim.api.nvim_create_autocmd("FileType", {
  callback = function(_)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
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
