local site = vim.fs.joinpath(vim.fn.stdpath("data"), "site")

local function bootstrap(name)
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

local function setup()
  require("mini.deps").setup({
    job = { timeout = 60000 },
    path = { package = site },
    silent = true
  })
end

---@param specs table[]
local function add(specs)
  for _, spec in ipairs(specs) do
    local name = spec.name or vim.fn.fnamemodify(spec.source, ":t")
    local path = vim.fs.joinpath(site, "pack/deps/opt", name)
    if not vim.uv.fs_stat(path) then
      vim.notify("Installing `" .. name .. "`...")
    end
    require("mini.deps").add(spec, {})
  end
end

bootstrap("mini.deps")

setup()

add({
  {
    source = "nvim-mini/mini.hues",
    checkout = "v0.17.0"
  },
  {
    source = "neovim/nvim-lspconfig",
    checkout = "v2.5.0"
  },
  {
    source = "nvim-neo-tree/neo-tree.nvim",
    checkout = "v3.x",
    depends = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim"
    }
  }
})
