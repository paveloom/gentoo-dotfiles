vim.lsp.enable("bashls")
vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")

local group = vim.api.nvim_create_augroup("config.lsp", {})

vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    local function map(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, {
        noremap = true,
        buffer = args.buf
      })
    end

    if
      not client:supports_method("textDocument/willSaveWaitUntil")
      and client:supports_method("textDocument/formatting")
    then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({
            bufnr = args.buf, id = client.id, timeout_ms = 1000
          })
        end
      })
    end

    if client:supports_method("textDocument/inlayHint") then
      map("n", "<A-c>", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end)
    end

    map("n", "gR", vim.lsp.buf.rename)
    map("n", "ga", vim.lsp.buf.code_action)
    map("n", "gd", vim.lsp.buf.definition)
    map("n", "gh", vim.lsp.buf.hover)

    map("n", "<leader>r", function()
      require("snacks").picker.lsp_references()
    end)

    map("n", "<leader>s", function()
      require("snacks").picker.lsp_symbols()
    end)

    map("n", "<leader>S", function()
      require("snacks").picker.lsp_workspace_symbols()
    end)
  end
})
