local lsp = require("config.lsp")

vim.lsp.enable({
  "bashls",
  "clangd",
  "gopls",
  "lua_ls",
  "neocmake",
  "rust_analyzer",
  "yamlls"
})

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
