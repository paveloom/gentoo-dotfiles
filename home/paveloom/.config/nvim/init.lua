local site = vim.fs.joinpath(vim.fn.stdpath("data"), "site")

local function bootstrap(spec)
  local name = spec.name or vim.fn.fnamemodify(spec.source, ":t")
  local path = vim.fs.joinpath(site, "pack/deps/start", name)
  if not vim.uv.fs_stat(path) then
    vim.notify("Bootstrapping `" .. name .. "`...")
    local url = "https://github.com/" .. spec.source
    vim.system({
      "git", "clone", "--filter=blob:none",
      "--branch", spec.checkout,
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

bootstrap({
  source = "nvim-mini/mini.deps",
  checkout = "v0.17.0"
})

setup()

add({
  { source = "Darazaki/indent-o-matic",         checkout = "764da1f" },
  { source = "folke/snacks.nvim",               checkout = "v2.30.0" },
  { source = "j-hui/fidget.nvim",               checkout = "v1.6.1" },
  { source = "lewis6991/gitsigns.nvim",         checkout = "v1.0.2" },
  { source = "linrongbin16/gitlinker.nvim",     checkout = "v5.3.0" },
  { source = "neovim/nvim-lspconfig",           checkout = "v2.5.0" },
  { source = "nvim-mini/mini.hipatterns",       checkout = "v0.17.0" },
  { source = "nvim-tree/nvim-tree.lua",         checkout = "v1.14.0" },
  { source = "nvim-tree/nvim-web-devicons",     checkout = "v0.100" },
  { source = "nvim-treesitter/nvim-treesitter", checkout = "v0.10.0" },
  { source = "saghen/blink.cmp",                checkout = "v1.8.0" }
})

-- Allow project-local configuration
vim.opt.exrc = true
