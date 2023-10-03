local slow_scroll = function(prompt_bufnr, direction)
  local state = require "telescope.state"
  local action_state = require "telescope.actions.state"
  local previewer = action_state.get_current_picker(prompt_bufnr).previewer
  local status = state.get_status(prompt_bufnr)
  -- Check if we actually have a previewer and a preview window
  if type(previewer) ~= "table" or previewer.scroll_fn == nil or status.preview_win == nil then
    return
  end
  previewer:scroll_fn(1 * direction)
end


local options = {
  defaults = {
    preview = {
      treesitter = false,
    },
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    results_title = false,
    sorting_strategy = "ascending",
    layout_strategy = "center",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      anchor = "s",
      preview_cutoff = 1, -- preview should always show (unless previewer = false)
      width = function(_, max_columns, _)
        return math.min(max_columns, 80)
      end,
      height = 0.4,
    },
    border = true,
    borderchars = {
      prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
    mappings = {
      i = {
        ["<C-e>"] = function(bufnr)
          slow_scroll(bufnr, 1)
        end,
        ["<C-y>"] = function(bufnr)
          slow_scroll(bufnr, -1)
        end,
        -- ["<S-o>"] = require("telescope.actions").select_all,
        -- ["<S-t>"] = require("telescope.actions").toggle_all,
        ["<C-d>"] = "delete_buffer",
      },
      n = {
        ["<C-d>"] = "delete_buffer",
        ["q"] = require("telescope.actions").close,
      },
    },
  },
  pickers = {
    layout_config = {
      scroll_speed = 1,
    },
  },
}

return options
