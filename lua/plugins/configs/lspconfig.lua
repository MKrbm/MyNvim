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

require("lspconfig").texlab.setup({})

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


if vim.fn.exepath("python3") == "" then
	print("Python not found")
else
	print("Python found")
end
python_executable = vim.fn.exepath('python3')
pylsp_executable = vim.fn.exepath('pylsp')
print("Python executable: " .. python_executable)
print("Pylsp executable: " .. pylsp_executable)


require("lspconfig").pylsp.setup({
	cmd = { pylsp_executable, "--log-file", "/tmp/pyls.log" },
	filetypes = { "python" },
	settings = {
		pylsp = {
			configurationSources = { "flake8" },
			formatCommand = { "black" },
			plugins = {
				-- formatter options
				black = { enabled = true },
				autopep8 = { enabled = false },
				yapf = { enabled = false },
				-- linter options
				flake8 = { enabled = true, maxLineLength = 100 },
				pyflakes = { enabled = false },
				pycodestyle = { enabled = false },
				-- type checker
				pylsp_mypy = {
					enabled = true,
					overrides = {
						"--python-executable",
						python_executable,
						true
					}
				},
				mypy = { enabled = false },
				-- auto-completion options
				jedi_completion = { fuzzy = false },
				-- import sorting
				pyls_isort = { enabled = false },
				-- -- Lint
				-- pycodestyle = {
				-- 	enabled = false,
				-- 	maxLineLength = 100, -- default: 79
				-- 	aggressive = 2,
				-- },
				-- flake	= {
				-- 	enabled = false,
				-- 	maxLineLength = 100,
				-- 	ignore = { "E501" },
				-- },
				-- mypy = {
				-- 	enabled = false,
				-- 	live_mode = false,
				-- 	strict = true,
				-- 	overrides = { "--python-executable", python_executable },
				-- },
				-- -- -- Code refactor
				-- rope = { enabled = true }, -- This is a python refactoring library (refactor means renaming, extracting functions, ...)
				--
				-- pydocstyle = { -- n: make sure to install pydocstyle before using it
				-- 	enabled = false, -- n: this is a python docstring style checker
				-- 	convention = "google",
				-- },
				--
				-- -- Formatting
				-- black = { enabled = false },
				-- pyls_isort = { enabled = false },
				-- yapf = { enabled = false },
				-- autopep8 = { enabled = true, maxLineLength = 100 }, -- autopep8 is a python formatting library (it fixes the pycodestyle errors)
			},
		},
	}
	-- 		-- log_file = "/tmp/pylsp.log",
	-- 	},
})
-- })

require("lspconfig").julials.setup({})


vim.diagnostic.config({
	underline = false,
	-- virtual_text = {
	-- 	prefix = "",
	-- 	severity = nil,
	-- 	source = "if_many",
	-- 	format = nil,
	-- },
	virtual_text = false,
	signs = true,
	severity_sort = false,
	update_in_insert = false,
})
-- vim.diagnostic.config({
--   virtual_text = true,
--   underline = true,
-- })
