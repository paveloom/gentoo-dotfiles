require("snacks").setup({
  picker = {
    hidden = true,
    layout = {
      layout = {
        box = "vertical",
        backdrop = false,
        width = 0.9,
        height = 0.9,
        row = 1,
        {
          box = "vertical",
          border = true,
          title = "{title} {live} {flags}",
          { win = "input", height = 1, border = "bottom" },
          { win = "list" }
        },
        {
          border = true,
          title = "{preview}",
          win = "preview"
        }
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

local map = vim.keymap.set

map("n", "<leader>b", function()
  require("snacks").picker.buffers()
end)

map("n", "<leader>d", function()
  require("snacks").picker.diagnostics_buffer()
end)

map("n", "<leader>D", function()
  require("snacks").picker.diagnostics()
end)

map("n", "<leader>f", function()
  require("snacks").picker.smart({
    multi = { "buffers", "files" }
  })
end)

map("n", "<leader>h", function()
  require("snacks").picker.help()
end)

map("n", "<leader>H", function()
  require("snacks").picker.highlights()
end)

map("n", "<leader>'", function()
  require("snacks").picker.resume()
end)

map("n", "<leader>/", function()
  require("snacks").picker.grep()
end)

map("n", "<leader>?", function()
  require("snacks").picker.keymaps()
end)
