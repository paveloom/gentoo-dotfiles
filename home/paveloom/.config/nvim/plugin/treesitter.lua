-- Look up queries in the system last
vim.opt.runtimepath:append("/usr/share/tree-sitter")

--- @param lang string Name of parser
--- @param filetype string|string[] Filetype(s) to associate with lang
local function register(lang, filetype)
  vim.treesitter.language.register(lang, filetype)

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
  json = { "json" }
}

for lang, filetype in pairs(filetypes) do
  register(lang, filetype)
end
