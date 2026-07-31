-- To reload the theme, run `:colorscheme custom`

if vim.g.colors_name ~= nil then vim.cmd.highlight("clear") end
vim.g.colors_name = "custom"

local function hi(name, val)
  vim.api.nvim_set_hl(0, name, val)
end

hi("Normal", { bg = "White", fg = "Black" })
hi("NormalFloat", { link = "Normal" })

hi("CursorLineNR", { link = "Normal" })
hi("FoldColumn", { link = "Normal" })
hi("NonText", { link = "Normal" })
hi("SignColumn", { link = "Normal" })
hi("StatusLine", { link = "Visual" })
hi("Visual", { link = "CursorLine" })

hi("Pmenu", { link = "Normal" })
hi("PmenuKind", { bg = "none" })
hi("PmenuSel", { link = "Visual" })
hi("WinSeparator", { link = "Normal" })

hi("GitSignsAdd", { fg = "DarkGreen" })
hi("GitSignsChange", { fg = "DarkYellow" })
hi("GitSignsDelete", { fg = "DarkRed" })

hi("PreProc", { bold = true, update = true })
