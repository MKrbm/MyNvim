return {
	-- Session management. This saves your session in the background,
	-- keeping track of open buffers, window arrangement, and more.
	-- You can restore sessions when returning through the dashboard.
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
		-- stylua: ignore
		keys = {
			{
				"<leader>qs",
				function() require("persistence").load() end,
				desc = "Restore Session"
			}, {
			"<leader>qS",
			function() require("persistence").select() end,
			desc = "Select Session"
		}, {
			"<leader>ql",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Restore Last Session"
		}, {
			"<leader>qd",
			function() require("persistence").stop() end,
			desc = "Don't Save Current Session"
		}
		}
		,
	}, -- library used by other plugins
	{ "tpope/vim-surround",    lazy = false },
	{ "nvim-lua/plenary.nvim", lazy = true },
	{
		"mbbill/undotree",
		lazy = true,
		cmd = { "UndotreeToggle" },
		config = function()
			vim.g.undotree_WindowLayout = 2
		end,
	},
	{
		"numToStr/Comment.nvim",
		keys = {
			{ "\\gcc", mode = "n",          desc = "Comment toggle current line" },
			{ "\\gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
			{ "\\gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
			{ "\\gbc", mode = "n",          desc = "Comment toggle current block" },
			{ "\\gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
			{ "\\gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
		},
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},
	{
		"rhysd/clever-f.vim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("plugins.configs.clever-f"),
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		build = ":call mkdp#util#install()",
	},
	{
		"chentoast/marks.nvim",
		lazy = false,
		config = function()
			require("marks").setup({
				mappings = {
					set_next = "m,",
					next = "m]",
					preview = "m:",
					set_bookmark0 = "m0",
					prev = false, -- pass false to disable only this default mapping
				},
			})
		end,
	},
}
