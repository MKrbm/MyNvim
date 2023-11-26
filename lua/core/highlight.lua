local M = {}

local set_cs = function(colorscheme)
	M.hl.NormalNC = {
		bg = colorscheme.NormalNC,
		fg = "white"
	}

	M.hl.Normal = {
		bg = colorscheme.Normal,
		fg = "white"
	}

	M.hl.CursorLine = {
		bg = colorscheme.NormalNC,
	}

	M.hl.Terminal = {
		bg = colorscheme.Terminal,
		fg = "white",
	}

	-- if TabLine then apply the color
	if colorscheme.TabLine then
		M.hl.TabLine = {
			fg = colorscheme.TabLine,
			-- fg = "white",
		}
	end

	-- if TabLineFill then apply the color
	if colorscheme.TabLineSel then
		M.hl.TabLineSel = {
			fg = colorscheme.TabLineSel,
			-- fg = "white",
		}
	end
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


print(vim.inspect(M))

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
