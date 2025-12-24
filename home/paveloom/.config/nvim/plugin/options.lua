-- Set the color scheme
vim.cmd.colorscheme("custom")

-- Show line numbers
vim.opt.number = true

-- Highlight the current line's number
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Don't time out on key codes
vim.opt.timeout = false

-- Allow the cursor to move to the upper line while pressing Left
vim.opt.whichwrap = "<,>,[,]"

-- Make some of the invisible characters visible
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "-", nbsp = "+" }

-- Wrap at word boundaries
vim.opt.linebreak = true

-- Keep undo history
vim.opt.undofile = true

-- Always show the sign column
vim.opt.signcolumn = "yes"

-- Enable spell checking
vim.opt.spell = true

-- Set completion options
vim.opt.completeopt = { "fuzzy", "menuone", "noselect", "nosort", "preview" }

-- Use rounded borders on all floating windows
vim.opt.winborder = "rounded"

-- Make searching case insensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true
