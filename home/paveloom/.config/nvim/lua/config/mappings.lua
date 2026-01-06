local m = {}

m.map = vim.keymap.set

function m.map_buf(bufnr)
  return function(mode, lhs, rhs)
    m.map(mode, lhs, rhs, { buffer = bufnr })
  end
end

return m
