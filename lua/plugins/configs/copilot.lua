return function()
	vim.defer_fn(function()
		require("copilot").setup({
			cmp = {
				enabled = true,
				method = "getCompletionsCycling",
			},
			panel = {
				-- if true, it can interfere with completions in copilot-cmp
				enabled = true,
				autorefresh = true,
				keymap = {
					jump_prev = "g[",
					jump_next = "g]",
					accept = "<CR>",
					refresh = "gr",
					open = "<C-End>",
				},
			},
			suggestion = {
				-- if true, it can interfere with completions in copilot-cmp
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<A-i>",
					accept_word = false,
					accept_line = false,
					next = "<A-S-n>",
					prev = "<A-S-p>",
					-- dismiss = "<C-]>",
				},
			},
			filetypes = {
				-- ["dap-repl"] = true,
				-- ["big_file_disabled_ft"] = true,
				markdown = true,
				yaml = true,
				yml = true,
			},
		})
	end, 100)
end
