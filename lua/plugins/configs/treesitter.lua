
local options = {
  ensure_installed = { "lua", "c", "cpp", "python"},
  highlight = {
    enable = true,
    use_languagetree = true,
    -- disable = {
    --   "cpp",
    --   "c"
    -- },
  },
  indent = { enable = false },

  -- textobjects = {
  --   move = {
  --     enable = true,
  --     set_jumps = true, -- whether to set jumps in the jumplist
  --     goto_next_start = {
  --       ["]m"] = "@function.outer",
  --       ["]]"] = { query = "@class.outer", desc = "Next class start" },
  --       ["]o"] = "@loop.*",
  --       ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
  --       ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
  --     },
  --     goto_next_end = {
  --       ["]M"] = "@function.outer",
  --       ["]["] = "@class.outer",
  --     },
  --     goto_previous_start = {
  --       ["[m"] = "@function.outer",
  --       ["[["] = "@class.outer",
  --     },
  --     goto_previous_end = {
  --       ["[M"] = "@function.outer",
  --       ["[]"] = "@class.outer",
  --     },
  --     goto_next = {
  --       ["]d"] = "@conditional.outer",
  --     },
  --     goto_previous = {
  --       ["[d"] = "@conditional.outer",
  --     }
  --   },
  -- },
}

return options
