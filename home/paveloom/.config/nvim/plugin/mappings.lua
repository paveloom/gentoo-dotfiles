local map = vim.keymap.set

-- Set the leader key
vim.g.mapleader = " "

-- Move cursor up or down by display lines
map("i", "<Down>", "<C-o>gj")
map("i", "<Up>", "<C-o>gk")
map({ "n", "v" }, "<Down>", "gj")
map({ "n", "v" }, "<Up>", "gk")

-- Jump by 5 lines with <C-Up> and <C-Down>
map("i", "<C-Down>", "<C-o>5gj")
map("i", "<C-Up>", "<C-o>5gk")
map({ "n", "v" }, "<C-Down>", "5gj")
map({ "n", "v" }, "<C-Up>", "5gk")

-- Delete previous words with <C-Esc>
map("c", "<C-H>", "<C-w><C-l>")
map("i", "<C-H>", "<C-w>")

-- Insert from the system clipboard with <C-v>
map("i", "<C-v>", "<C-r><C-p>+")

-- Write the current buffer with <C-s>
map("n", "<C-s>", "<cmd>write<cr>")

-- Close the current buffer with <C-q>
map("n", "<C-q>", "<cmd>quit<cr>")

-- Search for the word under the cursor with <C-f>
map("n", "<C-f>", "*")

-- Shift lines by one indent level always
map("n", ">", ">>")
map("n", "<", "<<")
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Navigate to the alternate file with `<C-p>`
map("n", "<C-p>", "<C-^>")

-- Navigate the jump list with <leader>q and <leader>e
map("n", "<leader>q", "<C-o>")
map("n", "<leader>e", "<C-i>")

-- Change and delete into the black hole register
map({ "n", "x" }, "c", "\"_c")
map("n", "C", "\"_C")
map({ "n", "x" }, "d", "\"_d")
map("n", "D", "\"_D")
map("x", "p", "pgvy")

-- Switch between modes of viewing diagnostics with <A-v>
map("n", "<A-v>", function()
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
