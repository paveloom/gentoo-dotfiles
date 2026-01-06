local lsp = require("config.lsp")

vim.lsp.enable("bashls")
vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("marksman")

vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp.group,
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    local map = require("config.mappings").map_buf(args.buf)

    if client:supports_method("textDocument/inlayHint") then
      map("n", "<A-c>", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end)
    end

    map("n", "ga", vim.lsp.buf.code_action)
    map("n", "gd", vim.lsp.buf.definition)
    map("n", "gi", vim.lsp.buf.implementation)
    map("n", "gR", vim.lsp.buf.rename)
    map("n", "gt", vim.lsp.buf.type_definition)

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

vim.api.nvim_create_autocmd("LspProgress", {
  group = lsp.group,
  callback = function()
    vim.notify(vim.lsp.status())
  end
})
