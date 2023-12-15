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


require("lspconfig").bashls.setup({})

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

local python_folder = os.getenv("CONDA_PREFIX")
local python_executable = python_folder .. "/bin/python"
local pylsp_executable = python_folder .. "/bin/pylsp"

require("lspconfig").pylsp.setup({
	cmd = { pylsp_executable, "--log-file", "/tmp/pylsp.log" },
	filetypes = { "python" },
	settings = {
		pylsp = {
			configurationSources = { "pycodestyle" },
			formatCommand = { "autopep8" },
			plugins = {
				-- Lint
				pycodestyle = {
					enabled = true,
					maxLineLength = 100, -- default: 79
					aggressive = 2,
				},
				mypy = {
					enabled = true,
					live_mode = false,
					strict = true,
					overrides = { "--python-executable", python_executable },
				},
				-- -- Code refactor
				rope = { enabled = true }, -- This is a python refactoring library (refactor means renaming, extracting functions, ...)

				-- Formatting
				black = { enabled = false },
				pyls_isort = { enabled = false },
				yapf = { enabled = false },
				autopep8 = { enabled = true, maxLineLength = 100 }, -- autopep8 is a python formatting library (it fixes the pycodestyle errors)
			},
			log_file = "/tmp/pylsp.log",
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
