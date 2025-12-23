local map = vim.keymap.set

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
