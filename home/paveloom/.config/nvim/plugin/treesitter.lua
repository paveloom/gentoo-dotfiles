-- Look up queries there
vim.opt.runtimepath:prepend("/usr/share/tree-sitter")

--- @param lang string Name of parser
--- @param filetype string|string[] Filetype(s) to associate with lang
local function register(lang, filetype)
  local path = string.format("/usr/lib64/libtree-sitter-%s.so", lang)
  local ok, _ = pcall(vim.treesitter.language.add, lang, { path = path })
  if not ok then
    local msg = string.format("Failed to register a parser for `%s`!", lang)
    vim.notify(msg, vim.log.levels.WARN)
    return
  end

  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetype,
    callback = function(ev)
      vim.treesitter.start(ev.buf)
    end
  })
end

local filetypes = {
  cmake = { "cmake" }
}

for lang, ft in pairs(filetypes) do
  register(lang, ft)
end
