return {
	{
		"phaazon/hop.nvim",
		lazy = false,
		config = function()
			require("hop").setup({
				case_insensitive = false,
				char2_fallback_key = "<CR>",
				quit_key = "<Esc>",
			})
		end,
	},
	{
		"ggandor/leap.nvim",
		lazy = false,
		dependencies = { "tpope/vim-repeat" },
		config = function()
			-- require("leap").add_repeat_mappings(";", ",", {
			--   relative_directions = true,
			--   modes = { "n", "x", "o" },
			-- })
			require("leap").setup({
				safe_labels = {
					-- "a","s", "d","f","j","k","l","w","e","r","u","i","o","p","g","h","t","y","v","b","n","m","z","x","c","q", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
					-- "/", ",","."
				},
			})
		end,
	},
}