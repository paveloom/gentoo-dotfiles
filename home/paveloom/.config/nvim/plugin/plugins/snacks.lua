require("snacks").setup({
  picker = {
    hidden = true,
    layout = {
      layout = {
        backdrop = false,
        width = 0.9,
        height = 0.9,
        row = 1
      }
    },
    win = {
      input = {
        keys = {
          ["<Esc>"]      = { "close", mode = { "n", "i" } },
          ["<PageDown>"] = { "preview_scroll_down", mode = { "n", "i" } },
          ["<PageUp>"]   = { "preview_scroll_up", mode = { "n", "i" } }
        }
      }
    }
  }
})

vim.keymap.set("n", "<leader>b", function()
  require("snacks").picker.buffers()
end)

vim.keymap.set("n", "<leader>f", function()
  require("snacks").picker.smart()
end)

vim.keymap.set("n", "<leader>h", function()
  require("snacks").picker.help()
end)

vim.keymap.set("n", "<leader>H", function()
  require("snacks").picker.highlights()
end)

vim.keymap.set("n", "<leader>/", function()
  require("snacks").picker.grep()
end)

vim.keymap.set("n", "<leader>'", function()
  require("snacks").picker.resume()
end)
