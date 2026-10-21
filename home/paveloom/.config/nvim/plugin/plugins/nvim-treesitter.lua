local nvim_treesitter = require("nvim-treesitter")

nvim_treesitter.install({ "c", "lua", "markdown", "query", "vim", "vimdoc" })

vim.api.nvim_create_autocmd("FileType", {
  callback = function(event)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

    vim.schedule(function()
      local filetype = event.match
      local bufnr = event.buf

      local langs = nvim_treesitter.get_available()
      local lang = vim.treesitter.language.get_lang(filetype)

      if vim.tbl_contains(langs, lang) then
        require("nvim-treesitter").install({ lang }):await(function()
          if vim.api.nvim_buf_is_valid(bufnr) then
            vim.treesitter.start(bufnr)
          end
        end)
      end
    end)
  end
})
