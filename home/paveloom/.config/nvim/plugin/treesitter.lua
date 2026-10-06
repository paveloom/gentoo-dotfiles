-- Run `:checkhealth vim.treesitter` to check Tree-sitter health

-- Parsers are picked up from the `~/.config/nvim/parser` directory

-- Look up queries bundled with Neovim first, system queries last
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
  json = { "json" },
  zig = { "zig" }
}

for lang, filetype in pairs(filetypes) do
  register(lang, filetype)
end
