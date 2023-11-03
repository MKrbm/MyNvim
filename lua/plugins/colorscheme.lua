return {
	-- add gruvbox
	{ "ellisonleao/gruvbox.nvim" },
	{ "EdenEast/nightfox.nvim" },
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = { style = "moon" },
	},


	-- decay	
	{
		"decaycs/decay.nvim",
		lazy = true,
		opts = { style = "dark" },
	},

	-- add everforest
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				-- Your config here
			})
		end,
	},

	-- Configure LazyVim to load gruvbox
	{
    "LazyVim/LazyVim",
    lazy = false,
		opts = {
			-- colorscheme = "everforest",
			-- colorscheme = "nordfox",
      colorscheme = "decay",
      checker = {
        enabled = false,
      }
		},
	},
}

