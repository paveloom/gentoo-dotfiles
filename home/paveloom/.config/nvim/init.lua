-- Bootstrap `mini.nvim`, use `mini.deps` for managing plugins afterwards

local path_package = vim.fs.joinpath(vim.fn.stdpath("data"), "site")
local path_mini = vim.fs.joinpath(path_package, "pack/deps/start/mini.nvim")
if not vim.uv.fs_stat(path_mini) then
  vim.notify("Installing `mini.nvim`...")
  vim.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/nvim-mini/mini.nvim', path_mini
  }):wait()
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.notify("Installed `mini.nvim`")
end

require("mini.deps").setup({ path = { package = path_package } })

vim.cmd.colorscheme("custom")
