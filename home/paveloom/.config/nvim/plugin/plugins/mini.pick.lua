require("mini.pick").setup();

vim.keymap.set("n", "<leader>b", function()
  require("mini.pick").builtin.buffers()
end)

vim.keymap.set("n", "<leader>f", function()
  require("mini.pick").builtin.files()
end)

vim.keymap.set("n", "<leader>h", function()
  require("mini.pick").builtin.help()
end)

vim.keymap.set("n", "<leader>/", function()
  require("mini.pick").builtin.grep_live()
end)

vim.keymap.set("n", "<leader>'", function()
  require("mini.pick").builtin.resume()
end)
