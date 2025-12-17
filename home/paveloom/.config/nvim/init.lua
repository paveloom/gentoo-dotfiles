-- Bootstrap `mini.deps` and `mini.hues`

local path_package = vim.fs.joinpath(vim.fn.stdpath("data"), "site")

local function bootstrap(name)
  local path = vim.fs.joinpath(path_package, "pack/deps/start", name)
  if not vim.uv.fs_stat(path) then
    vim.notify("Installing `" .. name .. "`...")
    local url = "https://github.com/nvim-mini/" .. name
    vim.system({ "git", "clone", "--filter=blob:none", url, path }):wait()
    vim.cmd.packadd(name)
    vim.cmd.helptags(vim.fs.joinpath(path, "doc"))
  end
end

bootstrap("mini.deps")
bootstrap("mini.hues")

require("mini.deps").setup({ path = { package = path_package } })
