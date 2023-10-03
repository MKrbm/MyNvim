require("mason").setup({
  ensure_installed = {
    "prettier",
  },
})
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
  },
})

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
