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
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg"
    }
  }
})

-- Set up the status line

function DiagnosticStatus(bufnr)
  local counts = vim.diagnostic.count(bufnr)
  local config = vim.diagnostic.config() --[[@as vim.diagnostic.Opts]]
  local user_signs = vim.tbl_get(config, "signs", "text") or {}
  local signs = vim.tbl_extend("keep", user_signs, { "E", "W", "I", "H" })
  local result_str = vim
    .iter(pairs(counts))
    :map(function(severity, count)
      return ("%s:%s"):format(signs[severity], count)
    end)
    :join(" ")

  return result_str
end

vim.api.nvim_create_autocmd("DiagnosticChanged", {
  group = vim.api.nvim_create_augroup("nvim.diagnostic.status", {}),
  callback = function(ev)
    vim.api.nvim__redraw({ buf = ev.buf, statusline = true })
  end,
  desc = "diagnostics component for the statusline"
})

vim.opt.statusline =
  "%<%{expand('%:.')} %h%w%m%r   %{get(b:,'gitsigns_status','')} %{v:lua.DiagnosticStatus(0)}" ..
  "%=" ..
  "%{v:lua.DiagnosticStatus()}   %{get(b:,'gitsigns_head','')}   %y   %15.(%l,%c%V   %P%)"

-- Set up the diff mode
vim.opt.diffopt = "closeoff,context:5,horizontal,internal"
