local M = {}

local set_hl_group = function(group, styles)
  vim.api.nvim_set_hl(0, group, styles)
end

M.setup = function()
  for group, styles in pairs(M.hl) do
    set_hl_group(group, styles)
  end
end

M.hl = {
  -- Comment = {
  --   italic = true,
  --   sp = "",
  --   fg = "",
  --   bg = "",
  -- },
  --
  --
  --
  -- NvimTreeWinSeparator = {
  --   bg = "gray",
  --   fg = "line",
  --   bold = true,
  -- },
  --
  -- VertSplit = {
  --   bg = "pink",
  --   fg = "pink",
  -- },
  CursorColumn = {
    bg = "red",
  },
  CursorLine = {
    bg = "#2e383c",
  },
  -- SpellBad = {
  --   undercurl = true,
  --   -- cterm = ""
  -- },
  --
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

  NormalNC = {
    bg = "#2e383c",
    fg = "",
    sp = "",
  },
  Normal = {
    bg = "#272e33",
    fg = "",
    sp = "",
  },

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


return M
