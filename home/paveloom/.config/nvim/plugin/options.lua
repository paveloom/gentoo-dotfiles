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

local function shadafile()
  local root = vim.fs.root(0, ".git") or "main"
  local shadafilename = string.gsub(root, "/", "%%") .. ".shada"
  return vim.fs.joinpath(vim.fn.stdpath("state"), "shada", shadafilename)
end

-- Use per-project `shada` files
vim.opt.shadafile = shadafile()

-- Enable spell checking
vim.opt.spell = true

-- Set completion options
vim.opt.completeopt = { "fuzzy", "menuone", "noselect", "nosort", "preview" }

-- Use rounded borders on all floating windows
vim.opt.winborder = "rounded"

-- Make searching case insensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Use the system clipboard for all yank, delete, and put operations
vim.opt.clipboard = "unnamedplus"

-- Always show the sign column
vim.opt.signcolumn = "yes"

-- Set up diagnostics
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = ""
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg"
    }
  }
})
