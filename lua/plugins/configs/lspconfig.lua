require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"tsserver",
		"clangd",
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

local python_path = os.getenv("CONDA_PREFIX") or os.getenv("VIRTUAL_ENV") or "/usr"
local python_executable = python_path .. "/bin/python"
local pylsp_executable = python_path .. "/bin/pylsp"

require("lspconfig").pylsp.setup({
	cmd = { pylsp_executable, "-v", "--log-file", "/tmp/pylsp.log"},
	filetypes = { "python" },
	settings = {
		pylsp = {
			configurationSources = {"pycodestyle"},
			formatCommand = {"autopep8"},
			plugins = {
				-- Lint
				pycodestyle = {
					enabled = true,
					maxLineLength = 120, -- default: 79
				},
				-- pycodestyle = {enabled = false}, -- pycodestyle is not compatible with flake8. We need to disable it.
				-- pylsp_mypy = {
				-- 	enabled = true,
				-- 	live_mode = true,
				-- 	strict = true,
				-- },

				-- -- Code refactor
				rope = { enabled = true }, -- This is a python refactoring library (refactor means renaming, extracting functions, ...)

				-- Formatting
				black = { enabled = false },
				pyls_isort = { enabled = false },
				yapf = { enabled = false },
				autopep8 = { enabled = true , maxLineLength = 120}, -- autopep8 is a python formatting library (it fixed the pycodestyle errors)
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
