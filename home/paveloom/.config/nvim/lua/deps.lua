local M = {}

local site = vim.fs.joinpath(vim.fn.stdpath("data"), "site")

-- Bootstrap a `mini.nvim` module
function M.bootstrap(name)
  local path = vim.fs.joinpath(site, "pack/deps/start", name)
  if not vim.uv.fs_stat(path) then
    vim.notify("Bootstrapping `" .. name .. "`...")
    local url = "https://github.com/nvim-mini/" .. name
    vim.system({
      "git", "clone", "--filter=blob:none", "--branch=v0.17.0",
      url, path
    }):wait()
    vim.cmd.packadd(name)
    vim.cmd.helptags(vim.fs.joinpath(path, "doc"))
  end
end

function M.setup()
  require("mini.deps").setup({
    job = { timeout = 60000 },
    path = { package = site },
    silent = true
  })
end

function M.add(spec, opts)
  local name = spec.name or vim.fn.fnamemodify(spec.source, ":t")
  local path = vim.fs.joinpath(site, "pack/deps/opt", name)
  if not vim.uv.fs_stat(path) then
    vim.notify("Installing `" .. name .. "`...")
  end
  require("mini.deps").add(spec, opts)
end

return M
