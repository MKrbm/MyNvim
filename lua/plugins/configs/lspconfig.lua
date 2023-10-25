require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "tsserver",
    "clangd",
    "pylsp",
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

require("lspconfig").clangd.setup({})

require("lspconfig").pylsp.setup({
  cmd = { "pylsp" },
  filetypes = { "python" },
  settings = {
    pylsp = {
      plugins = {
        -- Lint
        mypy = {
          enabled = true,
          live_mode = false,
          strict = true,
        },
        -- ruff = {
        --   enabled = true,
        --   select = {
        --     -- enable pycodestyle
        --     "E",
        --     -- enable pyflakes
        --     "F",
        --   },
        --   ignore = {
        --     -- ignore E501 (line too long)
        --     -- "E501",
        --     -- ignore F401 (imported but unused)
        --     -- "F401",
        --   },
        --   extendSelect = { "I" },
        --   severities = {
        --     -- Hint, Information, Warning, Error
        --     F401 = "I",
        --     E501 = "I",
        --   },
        -- },
        flake8 = {
          enabled = true,
          maxLineLength = 120,
        },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        mccabe = { enabled = false },

        -- Code refactor
        rope = { enabled = true },

        -- Formatting
        black = { enabled = true },
        pyls_isort = { enabled = false },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
      },
    },
  },
})

vim.diagnostic.config({
  virtual_text = false,
  underline = false,
})
