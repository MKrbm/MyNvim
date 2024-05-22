local M = {}

local set_cs = function(colorscheme)
	M.hl.NormalNC = {
		bg = colorscheme.NormalNC,
		fg = "white"
	}

	M.hl.Normal = {
		-- bg = colorscheme.Normal,
		bg = "none",
		fg = "white"
	}

	-- The color of cursor line
	M.hl.CursorLine = {
		bg = colorscheme.NormalNC,
	}

	M.hl.Terminal = {
		bg = colorscheme.Terminal,
		fg = "white",
	}

	-- The color of Visual selected area. bg : color of background. fg : color of font when selected.
	M.hl.Visual = {
		bg = "#ababab",
		fg = "#db4949",
	}

	-- The color of Visual selected area. bg : color of background. fg : color of font when selected.
	M.hl.Cursor = {
		bg = "red",
		fg = "red",
	}


	-- To make the background transparent

	-- M.hl.Normal = {
	-- 	bg = "none",
	-- }

	M.hl.NormalNC = {
		bg = "none",
	}

	M.hl.NvimTreeNormal = {
		bg = "none",
	}

	M.hl.NvimTreeNormalNC = {
		bg = "none",
	}

	M.hl.SignColumn = {
		bg = "none",
	}

	M.hl.LineNr = {
		bg = "none",
		fg = "DarkGrey"
	}

	M.hl.TabLineSel = {
		bg = colorscheme.NormalNC,
		italic = true,
	}
	-- --
	M.hl.TabLine = {
		bg = "none",
		fg = "Grey"
	}

	-- M.hl.StatusLine = {
	-- 	bg = "none",
	-- }
	--
	-- M.hl.StatusLineNC = {
	-- 	bg = "none",
	-- }

	M.hl.TabLineFill = {
		bg = "none",
	}

	-- End of transparent background

	-- if TabLine then apply the color
	-- if colorscheme.TabLine then
	-- 	M.hl.TabLine = {
	-- 		fg = colorscheme.TabLine,
	-- 		bg = "none",
	-- 		-- fg = "white",
	-- 	}
	-- end
	--
	-- -- if TabLineFill then apply the color
	-- if colorscheme.TabLineSel then
	-- 	M.hl.TabLineSel = {
	-- 		fg = colorscheme.TabLineSel,
	-- 		bg = "none",
	-- 		-- fg = "white",
	-- 	}
	-- end

end

local everforest = {
	NormalNC = "#2e383c",
	Normal = "#272e33",
	Terminal = "#7a8478",
}

local tokyonight = {
	NormalNC = "#24283b",
	Normal = "#1f2335",
	Terminal = "#1f2335",
}

local decay = {
	NormalNC   = "#0e1217",
	Normal     = "#101419",
	Terminal   = "#101419",
	TabLine    = "#b6beca",
	TabLineSel = "#78dba9",
}


-- print()

local set_hl_group = function(group, styles)
	vim.api.nvim_set_hl(0, group, styles)
end

M.setup = function()
	for group, styles in pairs(M.hl) do
		set_hl_group(group, styles)
	end
end

M.hl = {

	WinSeparator = {
		fg = "#415270",
		bg = "#415270",
	},
	rainbow1 = {
		fg = "#ffadad",
	},
	rainbow2 = {
		fg = "#ffd6a5",
	},

	rainbow3 = {
		fg = "#fdffb6",
	},
	rainbow4 = {
		fg = "#caffbf",
	},
	rainbow5 = {
		fg = "#9bf6ff",
	},
	rainbow6 = {
		fg = "#a0c4ff",
	},
	rainbow7 = {
		fg = "#bdb2ff",
	},
	-- MatchParen = {
	--   ctermbg = 16,
	--   bg =  "#3b2940",
	--   bold = true,
	--   link = "",
	-- },
	--


	-- TermCorsorNC = {
	--   bg = "pink",
	--   fg = "pink",
	-- },

	--
	-- IlluminatedWordWrite = {
	--   underline = false,
	--   undercurl = false,
	--   bg = "one_bg",
	-- },
	--
	-- IlluminatedWordText = {
	--   underline = false,
	--   undercurl = false,
	--   bg = "one_bg",
	-- },
	-- GlancePreviewNormal = { bg = "darker_black" },
	-- GlanceListNormal = { bg = "black2" },
}

-- set_cs(everforest)
-- set_cs(tokyonight)
set_cs(decay)

return M
