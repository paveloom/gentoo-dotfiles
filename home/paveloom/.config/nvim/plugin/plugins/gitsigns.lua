require("gitsigns").setup({
  on_attach = function(bufnr)
    local map = MapBuf(bufnr)

    map("n", "[g", function()
      require("gitsigns").nav_hunk("prev")
    end)
    map("n", "]g", function()
      require("gitsigns").nav_hunk("next")
    end)
    map("n", "gp", function()
      require("gitsigns").preview_hunk()
    end)
    map("n", "gr", function()
      require("gitsigns").reset_hunk()
    end)
  end
})
