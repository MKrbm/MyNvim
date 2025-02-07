return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
  },

  { "folke/snacks.nvim", opts = { dashboard = { enabled = false } } },
  {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      -- opts = function() return require("plugins.configs.ibl") end,
      config = function() return require("plugins.configs.ibl") end
  }, -- DAP (Debug Adapter Protocol)
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
