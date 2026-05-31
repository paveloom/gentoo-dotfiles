-- Look up queries in the system last
vim.opt.runtimepath:append("/usr/share/tree-sitter")

--- @param lang string Name of parser
--- @param filetype string|string[] Filetype(s) to associate with lang
local function register(lang, filetype)
  local lang_norm = string.gsub(lang, "_", "-")
  local path = string.format("/usr/lib64/libtree-sitter-%s.so", lang_norm)

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
  bash = { "bash" },
  cmake = { "cmake" },
  cpp = { "cpp" },
  markdown_inline = { "markdown" }
}

for lang, ft in pairs(filetypes) do
  register(lang, ft)
end
