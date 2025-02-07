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
}
