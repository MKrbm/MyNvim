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

require("lspconfig").clangd.setup({
	cmd = {
		-- see clangd --help-hidden
		"clangd",
		"--background-index",
		-- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
		-- to add more checks, create .clang-tidy file in the root directory
		-- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
		"--clang-tidy",
		"--completion-style=bundled",
		"--cross-file-rename",
		-- "--header-insertion=iwyu",
	},
})

require("lspconfig").pylsp.setup({
	cmd = { "pylsp" },
	filetypes = { "python" },
	settings = {
		pylsp = {
			plugins = {
				-- Lint
				flake8 = {
					enabled = true,
					maxLineLength = 180,
				},
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
				pyflakes = { enabled = false },
				pycodestyle = { enabled = false },
				mccabe = { enabled = false },
				--
				-- -- Code refactor
				rope = { enabled = true },

				-- Formatting
				black = { enabled = false },
				pyls_isort = { enabled = false },
				autopep8 = { enabled = true, line_length = 180 },
				yapf = { enabled = false },
			},
		},
	},
})

vim.diagnostic.config({
	underline = true,
	virtual_text = {
		prefix = "",
		severity = nil,
		source = "if_many",
		format = nil,
	},
	signs = false,
	severity_sort = true,
	update_in_insert = false,
})
-- vim.diagnostic.config({
--   virtual_text = true,
--   underline = true,
-- })
