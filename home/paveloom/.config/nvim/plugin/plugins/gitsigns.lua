require("gitsigns").setup({
  on_attach = function(bufnr)
    vim.keymap.set(
      "n", "[g",
      function() require("gitsigns").nav_hunk("prev") end,
      { buffer = bufnr }
    )
    vim.keymap.set(
      "n", "]g",
      function() require("gitsigns").nav_hunk("next") end,
      { buffer = bufnr }
    )
  end
})
