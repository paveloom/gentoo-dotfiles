return {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          unpack(vim.api.nvim_get_runtime_file("", true)),
        }
      }
    }
  }
}
