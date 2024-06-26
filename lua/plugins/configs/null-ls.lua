local null_ls = require("null-ls")

local b = null_ls.builtins

local filetypes = {
	"markdown",
}
local sources = {

	-- webdev stuff
	b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
	b.formatting.prettier.with({
		filetypes = {
			"vue",
			"typescript",
			"javascript",
			"typescriptreact",
			"javascriptreact",
			"yaml",
			"html",
			"css",
			"scss",
			"sh",
			"markdown",
		},
	}),

	-- Lua
	b.formatting.stylua,

	-- latex
	b.formatting.latexindent,

	-- bash
	b.formatting.beautysh,

	-- c++
	b.formatting.clang_format,

	-- latex
	b.formatting.latexindent,

	-- julia
	-- b.formatting.jupytext,
	-- Python
	-- b.diagnostics.mypy.with({
	-- 	extra_args = function()
	-- 		local virtual_env = os.getenv("CONDA_PREFIX")
	-- 		return {"--python-executable", virtual_env .. "/bin/python"}
	-- 	end,
	-- }),

	-- cpp
	-- b.formatting.clang_format.with {
	--   filetypes = { "c", "cpp" },
	--   extra_args = require("custom.configs.completion.clang_format"),
	-- },

	--   b.diagnostics.cspell.with {
	--     extra_args = {
	--       "-c",
	--       vim.fn.expand "~/.config/NvChad/cspell/cspell.json",
	--     },
	--     filetypes = filetypes,
	--     -- method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
	--   },
	--   b.code_actions.cspell.with {
	--     config = {
	--       find_json = function(_)
	--         return vim.fn.expand "~/.config/NvChad/cspell/cspell.json"
	--       end,
	--     },
	--     filetypes = filetypes,
	--     method = null_ls.methods.CODE_ACTION,
	--   },
}

null_ls.setup({
	debug = true,
	sources = sources,
})
