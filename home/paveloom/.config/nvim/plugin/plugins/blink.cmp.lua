require("blink.cmp").setup({
  completion = {
    documentation = { auto_show = true },
    list = { selection = { preselect = false, auto_insert = false } }
  },
  fuzzy = { implementation = "lua" },
  keymap = {
    preset = "enter",
    ["<PageUp>"] = { "scroll_documentation_up", "fallback" },
    ["<PageDown>"] = { "scroll_documentation_down", "fallback" }
  },
  signature = {
    enabled = true,
    window = {
      show_documentation = true
    }
  }
})
