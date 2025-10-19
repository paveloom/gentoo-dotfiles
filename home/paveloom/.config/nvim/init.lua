-- Bootstrap `mini.nvim`, use `mini.deps` for managing plugins afterwards
local path_site = vim.fs.joinpath(vim.fn.stdpath("data"), "site")
local path_mini = vim.fs.joinpath(path_site, "pack/deps/start/mini.nvim")
if not vim.uv.fs_stat(path_mini) then
  vim.notify("Installing `mini.nvim`...")
  vim.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/nvim-mini/mini.nvim', path_mini
  }):wait()
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.notify("Installed `mini.nvim`")
end
