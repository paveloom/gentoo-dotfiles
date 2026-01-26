-- To reload the theme, run `:colorscheme custom`

if vim.g.colors_name ~= nil then vim.cmd.highlight("clear") end
vim.g.colors_name    = "custom"

---@diagnostic disable: unused-local

local shade_0        = "#000000"
local shade_1        = "#B3B8B8"
local shade_2        = "#ABB0B0"
local shade_3        = "#B1B5B7"
local shade_4        = "#BBBEBF"
local shade_5        = "#C6C9CA"
local shade_6        = "#E2E4E5"
local shade_7        = "#ffffff"

local red            = "#a32a18"
local brown          = "#6d4f00"
local green          = "#247200"
local emerald        = "#007f31"
local teal           = "#006f81"
local blue           = "#2c4ab3"
local purple         = "#7527a8"
local violet         = "#a71a68"

local bright_red     = "#e75741"
local bright_brown   = "#a68306"
local bright_green   = "#4fad13"
local bright_emerald = "#14bc5f"
local bright_teal    = "#18a8be"
local bright_blue    = "#597cf9"
local bright_purple  = "#b052ec"
local bright_violet  = "#eb43a0"

local function hi(name, val)
  vim.api.nvim_set_hl(0, name, val)
end

hi("Normal", { bg = shade_7, fg = shade_0 })
hi("NormalFloat", { link = "Normal" })

hi("ColorColumn", { link = "Visual" })
hi("CursorLine", { link = "Visual" })
hi("LineNR", { fg = shade_2 })
hi("StatusLine", { bg = shade_6 })
hi("StatusLineNC", { bg = shade_5 })
hi("Visual", { bg = shade_6 })

hi("Pmenu", { link = "Normal" })
hi("PmenuKind", { bg = "none" })
hi("PmenuSel", { link = "Visual" })
hi("PmenuThumb", { bg = shade_7 })

-- Tree-sitter's capture groups are described at
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md

hi("@function", { fg = blue })
hi("@property", { fg = brown })
hi("@string", { fg = green })

hi("NvimTreeFolderIcon", { fg = shade_2 })

hi("SnacksPickerBufFlags", { link = "SnacksPickerFile" })
hi("SnacksPickerCol", { link = "SnacksPickerFile" })
hi("SnacksPickerDir", { link = "SnacksPickerFile" })

hi("GitSignsAdd", { fg = bright_green })
hi("GitSignsChange", { fg = bright_brown })
hi("GitSignsDelete", { fg = bright_red })
