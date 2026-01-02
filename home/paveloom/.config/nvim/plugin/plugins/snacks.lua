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
    sources = {
      files = {
        hidden = true,
        matcher = {
          cwd_bonus = true,
          frecency = true,
          sort_empty = true
        }
      },
      lsp_symbols = {
        sort = {
          fields = { "idx" }
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

Map("n", "<leader>b", function()
  require("snacks").picker.buffers()
end)

Map("n", "<leader>d", function()
  require("snacks").picker.diagnostics_buffer()
end)

Map("n", "<leader>D", function()
  require("snacks").picker.diagnostics()
end)

Map("n", "<leader>f", function()
  require("snacks").picker.files()
end)

Map("n", "<leader>h", function()
  require("snacks").picker.help()
end)

Map("n", "<leader>H", function()
  require("snacks").picker.highlights()
end)

Map("n", "<leader>'", function()
  require("snacks").picker.resume()
end)

Map("n", "<leader>/", function()
  require("snacks").picker.grep()
end)

Map("n", "<leader>?", function()
  require("snacks").picker.keymaps()
end)
