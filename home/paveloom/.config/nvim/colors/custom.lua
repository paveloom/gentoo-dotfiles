-- To reload the theme, run `:colorscheme adwaita_light`

if vim.g.colors_name ~= nil then vim.cmd.highlight("clear") end
vim.g.colors_name = "custom"

---@diagnostic disable: unused-local

-- See the GNOME HIG's palette reference at
-- https://developer.gnome.org/hig/reference/palette.html

local blue_1 = "#99c1f1"
local blue_2 = "#62a0ea"
local blue_3 = "#3584e4"
local blue_4 = "#1c71d8"
local blue_5 = "#1a5fb4"
local green_1 = "#8ff0a4"
local green_2 = "#57e389"
local green_3 = "#33d17a"
local green_4 = "#2ec27e"
local green_5 = "#26a269"
local yellow_1 = "#f9f06b"
local yellow_2 = "#f8e45c"
local yellow_3 = "#f6d32d"
local yellow_4 = "#f5c211"
local yellow_5 = "#e5a50a"
local orange_1 = "#ffbe6f"
local orange_2 = "#ffa348"
local orange_3 = "#ff7800"
local orange_4 = "#e66100"
local orange_5 = "#c64600"
local red_1 = "#f66151"
local red_2 = "#ed333b"
local red_3 = "#e01b24"
local red_4 = "#c01c28"
local red_5 = "#a51d2d"
local purple_1 = "#dc8add"
local purple_2 = "#c061cb"
local purple_3 = "#9141ac"
local purple_4 = "#813d9c"
local purple_5 = "#613583"
local brown_1 = "#cdab8f"
local brown_2 = "#b5835a"
local brown_3 = "#986a44"
local brown_4 = "#865e3c"
local brown_5 = "#63452c"
local light_1 = "#ffffff"
local light_2 = "#f6f5f4"
local light_3 = "#deddda"
local light_4 = "#c0bfbc"
local light_5 = "#9a9996"
local dark_1 = "#77767b"
local dark_2 = "#5e5c64"
local dark_3 = "#3d3846"
local dark_4 = "#241f31"
local dark_5 = "#000000"

local function hi(name, val)
  vim.api.nvim_set_hl(0, name, val)
end

hi("CursorLine", { link = "Visual" })
hi("LineNR", { fg = light_5 })
hi("Normal", { bg = light_1, fg = dark_5 })
hi("NormalFloat", { link = "Normal" })
hi("Pmenu", { link = "Normal" })
hi("PmenuKind", { bg = "none" })
hi("PmenuSel", { link = "Visual" })
hi("PmenuThumb", { bg = light_5 })
hi("StatusLine", { bg = light_2 })
hi("StatusLineNC", { bg = light_3 })
hi("Visual", { bg = light_3 })

-- Tree-sitter's capture groups are described at
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md

hi("@function", { fg = blue_5 })
hi("@property", { fg = brown_5 })
hi("@string", { fg = green_5 })

hi("NvimTreeFolderIcon", { fg = dark_1 })

hi("SnacksPickerBufFlags", { link = "SnacksPickerFile" })
hi("SnacksPickerCol", { link = "SnacksPickerFile" })
hi("SnacksPickerDir", { link = "SnacksPickerFile" })
