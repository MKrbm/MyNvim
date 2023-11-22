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
			plugins = {
				-- Lint
				flake8 = {
					enabled = true,
					maxLineLength = 180,
				},
				pylsp_mypy = {
					enabled = true,
					live_mode = true,
					strict = true,
				},
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
