require("nvim-tree").setup({
  disable_netrw = true,
  view = {
    float = {
      enable = true,
      open_win_config = { row = 0, col = 0 }
    },
    width = { padding = 3 }
  },
  renderer = {
    highlight_git = "name",
    icons = {
      show = {
        git = false
      }
    },
    root_folder_label = function(path)
      return vim.fn.pathshorten(vim.fn.fnamemodify(path, ":~"))
    end,
    special_files = {}
  },
  on_attach = function(buffer)
    local api = require("nvim-tree.api")

    local function opts(desc)
      return {
        desc = "nvim-tree: " .. desc,
        buffer = buffer,
        noremap = true,
        silent = true,
        nowait = true
      }
    end

    api.config.mappings.default_on_attach(buffer)

    Map("n", "<Esc>", api.tree.close, opts("Close"))
  end,
  diagnostics = {
    enable = true,
    show_on_dirs = true
  }
})

Map("n", "<leader>w", function()
  require("nvim-tree.api").tree.toggle({ find_file = true })
end)
