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

-- See the default Neovim theme reference at
-- https://github.com/nshern/neovim-default-colorscheme-extras

local dark_blue = "#004c63"
local dark_cyan = "#007373"
local dark_green = "#005523"
local dark_magenta = "#470045"
local dark_red = "#590008"
local dark_yellow = "#6b5300"
local light_blue = "#A6DBFF"
local light_cyan = "#8cf8f7"
local light_green = "#b4f6c0"
local light_magenta = "#FFCAFF"
local light_red = "#FFC0B9"
local light_yellow = "#FCE094"
local light_grey_1 = "#EEF1F8"
local light_grey_2 = "#E0E2EA"
local light_grey_3 = "#C4C6CD"
local light_grey_4 = "#9b9ea4"
local dark_grey_4 = "#4f5258"
local dark_grey_3 = "#2c2e33"
local dark_grey_2 = "#14161B"
local dark_grey_1 = "#07080D"

local function hi(name, val)
  vim.api.nvim_set_hl(0, name, val)
end

hi("Normal", { bg = light_1, fg = dark_5 })
hi("NormalFloat", { link = "Normal" })

hi("CursorLine", { link = "Visual" })
hi("LineNR", { fg = light_5 })
hi("StatusLine", { bg = light_2 })
hi("StatusLineNC", { bg = light_3 })
hi("Visual", { bg = light_3 })

hi("Pmenu", { link = "Normal" })
hi("PmenuKind", { bg = "none" })
hi("PmenuSel", { link = "Visual" })
hi("PmenuThumb", { bg = light_5 })

-- Tree-sitter's capture groups are described at
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md

hi("@function", { fg = blue_5 })
hi("@property", { fg = brown_5 })
hi("@string", { fg = green_5 })

hi("NvimTreeFolderIcon", { fg = dark_1 })

hi("SnacksPickerBufFlags", { link = "SnacksPickerFile" })
hi("SnacksPickerCol", { link = "SnacksPickerFile" })
hi("SnacksPickerDir", { link = "SnacksPickerFile" })

hi("GitSignsAdd", { fg = light_green })
hi("GitSignsChange", { fg = light_yellow })
hi("GitSignsDelete", { fg = light_red })
