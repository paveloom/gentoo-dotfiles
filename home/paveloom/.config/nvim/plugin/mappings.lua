local map = vim.keymap.set

-- Move cursor up or down by display lines
map("i", "<Down>", "<C-o>gj")
map("i", "<Up>", "<C-o>gk")
map({ "n", "v" }, "<Down>", "gj")
map({ "n", "v" }, "<Up>", "gk")
