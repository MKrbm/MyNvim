local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings

  vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts "Up")
  vim.keymap.set("n", "<C-e>", "<C-e>", opts "Scroll down") -- used to be open in one place
  vim.keymap.set("n", "e", "e", opts "e")
  vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")
  vim.keymap.set("n", "<S-w>", "<Plug>(leap-backward-to)", opts "leap-backward-to")
  vim.keymap.set("n", "<S-e>", api.tree.collapse_all, opts "fold all")
  vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "<C-Right>", "<CMD>NvimTreeResize +5<CR>", opts "Increase file explorer width")
  vim.keymap.set("n", "<C-Left>", "<CMD>NvimTreeResize -5<CR>", opts "Decrease file explorer width")
  vim.keymap.set("n", "<S-l>", function(node)
    local nt_api = require "nvim-tree.api"
    nt_api.node.open.edit(node)
    nt_api.tree.focus()
    vim.api.nvim_input "2w" -- Simulate 'w' keypress
  end, opts "Help")
end

local options = {
  on_attach = my_on_attach,
  auto_reload_on_write = true,
  create_in_closed_folder = false,
  disable_netrw = false,
  hijack_cursor = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = true,
  open_on_tab = false,
  respect_buf_cwd = false,
  sort_by = "name",
  sync_root_with_cwd = true,
  view = {
    adaptive_size = false,
    side = "left",
    width = 30,
    preserve_window_proportions = true,
  },
  git = {
    enable = true,
    ignore = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    root_folder_label = false,
    highlight_git = true,
    highlight_opened_files = "none",

    indent_markers = {
      enable = false,
    },

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },

      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}

return options
