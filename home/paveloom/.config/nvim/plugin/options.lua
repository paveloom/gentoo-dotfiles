-- Set the color scheme
vim.cmd.colorscheme("custom")

-- Show line numbers
vim.opt.number = true

-- Highlight the current line's number
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Don't time out on key codes
vim.opt.timeout = false

-- Set completion options
vim.opt.completeopt = { "fuzzy", "menuone", "noselect", "nosort", "preview" }

-- Use rounded borders on all floating windows
vim.opt.winborder = "rounded"

-- Make searching case insensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true
