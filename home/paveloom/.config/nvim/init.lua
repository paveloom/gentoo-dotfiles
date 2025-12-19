-- Bootstrap `mini.deps` and `mini.hues`

local path_package = vim.fs.joinpath(vim.fn.stdpath("data"), "site")

vim.cmd.redraw()

local function bootstrap(name)
  local path = vim.fs.joinpath(path_package, "pack/deps/start", name)
  if not vim.uv.fs_stat(path) then
    vim.notify("Installing `" .. name .. "`...")
    local url = "https://github.com/nvim-mini/" .. name
    vim.system({
      "git", "clone", "--filter=blob:none", "--branch=v0.17.0",
      url, path
    }):wait()
    vim.cmd.packadd(name)
    vim.cmd.helptags(vim.fs.joinpath(path, "doc"))
    vim.cmd.redraw()
  end
end

bootstrap("mini.deps")
bootstrap("mini.hues")

require("mini.deps").setup({
  job = { timeout = 60000 },
  path = { package = path_package }
})

MiniDeps.add({
  source = "neovim/nvim-lspconfig",
  checkout = "v2.5.0"
})
