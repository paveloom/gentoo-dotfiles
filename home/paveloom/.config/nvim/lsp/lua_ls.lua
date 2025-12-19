return {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/luv/library",
          unpack(vim.api.nvim_get_runtime_file("", true)),
        }
      }
    }
  }
}
