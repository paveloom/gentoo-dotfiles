require("gitsigns").setup({
  on_attach = function(bufnr)
    local map = MapBuf(bufnr)

    map("n", "[g", function()
      require("gitsigns").nav_hunk("prev")
    end)
    map("n", "]g", function()
      require("gitsigns").nav_hunk("next")
    end)
  end
})
