local m = {}

m.group = vim.api.nvim_create_augroup("config.lsp", { clear = true })

function m.format(filetypes)
  vim.api.nvim_create_autocmd("LspAttach", {
    group = m.group,
    callback = function(args)
      local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
      local filetype = vim.bo[args.buf].filetype

      if
        vim.tbl_contains(filetypes, filetype)
        and not client:supports_method("textDocument/willSaveWaitUntil")
        and client:supports_method("textDocument/formatting")
      then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = m.group,
          buffer = args.buf,
          callback = function()
            vim.lsp.buf.format({
              bufnr = args.buf, id = client.id, timeout_ms = 1000
            })
          end
        })
      end
    end
  })
end

return m
