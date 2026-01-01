Map = vim.keymap.set

MapBuf = function(bufnr)
  return function(mode, lhs, rhs)
    Map(mode, lhs, rhs, { buffer = bufnr })
  end
end

-- Set the leader key
vim.g.mapleader = " "

-- Move cursor up or down by display lines
Map("i", "<Down>", "<C-o>gj")
Map("i", "<Up>", "<C-o>gk")
Map({ "n", "v" }, "<Down>", "gj")
Map({ "n", "v" }, "<Up>", "gk")

-- Jump by 5 lines with <C-Up> and <C-Down>
Map("i", "<C-Down>", "<C-o>5gj")
Map("i", "<C-Up>", "<C-o>5gk")
Map({ "n", "v" }, "<C-Down>", "5gj")
Map({ "n", "v" }, "<C-Up>", "5gk")

-- Delete previous words with <C-Esc>
Map("c", "<C-H>", "<C-w><C-l>")
Map("i", "<C-H>", "<C-w>")

-- Insert from the system clipboard with <C-v>
Map("i", "<C-v>", "<C-r><C-p>+")

-- Write the current buffer with <C-s>
Map("n", "<C-s>", "<cmd>write<cr>")

-- Close the current buffer with <C-q>
Map("n", "<C-q>", "<cmd>quit<cr>")

-- Search for the word under the cursor with <C-f>
Map("n", "<C-f>", "*")

-- Shift lines by one indent level always
Map("n", ">", ">>")
Map("n", "<", "<<")
Map("v", "<", "<gv")
Map("v", ">", ">gv")

-- Navigate to the alternate file with `<C-p>`
Map("n", "<C-p>", "<C-^>")

-- Change and delete into the black hole register
Map({ "n", "x" }, "c", "\"_c")
Map("n", "C", "\"_C")
Map({ "n", "x" }, "d", "\"_d")
Map("n", "D", "\"_D")
Map("x", "p", "pgvy")

-- Switch between modes of viewing diagnostics with <A-v>
Map("n", "<A-v>", function()
  local config = vim.diagnostic.config() or {}

  if config.virtual_text then
    vim.diagnostic.config({ virtual_lines = true, virtual_text = false })
    return
  end

  if config.virtual_lines then
    vim.diagnostic.config({ virtual_lines = false, virtual_text = false })
    return
  end

  vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
end)
