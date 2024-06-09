local g = vim.g
local opt = vim.opt
local global = require("core.global")

local clipboard_config = function()
  if global.is_mac then
    vim.g.clipboard = {
      name = "macOS-clipboard",
      copy = {
        ["+"] = "pbcopy",
        ["*"] = "pbcopy"
      },
      paste = {
        ["+"] = "pbpaste",
        ["*"] = "pbpaste"
      },
      cache_enabled = 0
    }
  else -- if global.is_linux then
    vim.g.clipboard = {
      name = "linux-clipboard",
      copy = {
        ["+"] = "xclip -selection clipboard",
        ["*"] = "xclip -selection clipboard"
      },
      paste = {
        ["+"] = "xclip -selection clipboard -o",
        ["*"] = "xclip -selection clipboard -o"
      },
      cache_enabled = 0
    }
  end
end

local shell_config = function()
  if global.is_windows then
    print("windows are not supported")
  end
  if global.is_linux then
    opt.shell = "/bin/zsh"
  end
  if global.is_mac then
    opt.shell = "/bin/zsh"
  end
end

clipboard_config()
shell_config()

opt.exrc = true --- Allow vim to use .vimrc file in the current directory
-- Indenting
opt.shiftwidth = 2 --- Number of spaces used for each step of (auto)indent
-- opt.smartindent = true
opt.softtabstop = 2 --- Number of spaces that a <Tab> in the file counts for
opt.tabstop = 2 --- Number of spaces that a <Tab> in the file counts for

opt.fillchars = {
  eob = " " --- Character to show at the end of each line
}
opt.ignorecase = true --- Ignore case in search patterns
opt.smartcase = true --- Override the 'ignorecase' option if the search pattern contains upper case characters
opt.mouse = "a" --- Enable the use of the mouse

-- Numbers
opt.number = true --- Print the line number in front of each line
opt.relativenumber = true --- Print the line number of the cursor line relative to the cursor line
opt.numberwidth = 2 --- Number of columns used for line numbers
opt.ruler = false --- Show the cursor position all the time

-- disable nvim intro
opt.shortmess:append "sI" --- Shorten messages

opt.signcolumn = "yes" --- Always show the signcolumn, otherwise it would shift the text each time
opt.splitbelow = true --- When a new window is created, it will be below the current one
opt.splitright = true --- When a new window is created, it will be to the right of the current one
opt.termguicolors = true --- Enable true color support
opt.undofile = true --- Keep an undo file (undo history remains after closing Vim)
opt.laststatus = 2 --- Always display the status line
opt.splitkeep = "screen" --- Keep the screen layout when creating new windows
-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250 --- Time in milliseconds to wait for a key press

-- go to previous/next line with h,l,left arrow and right arrow when cursor reaches end/beginning of line
-- Allow certain keys to wrap to next line
opt.whichwrap:append "<>[]hl"
opt.foldmethod = "indent" --- Folding is done by indent level
opt.foldlevelstart = 99 --- Start editing with all folds open
g.foldmethod = "indent" --- Folding is done by indent level
g.foldlevelstart = 99 --- Start editing with all folds open
g.mapleader = " " --- The leader of your key mappings

-- disable netrw at the very start of your init.lua
vim.o.exrc = true --- Allow vim to use .vimrc file in the current directory
vim.o.secure = true --- Disallow shell and write commands in .vimrc

-- autocommand
vim.api.nvim_exec([[
    augroup NvimTreeCursorColumn
        autocmd!
        autocmd FileType NvimTree setlocal nocursorcolumn
    augroup END

    augroup NvimTreeCursorColumn
        autocmd!
        autocmd FileType NvimTree setlocal nocursorcolumn
    augroup END

    augroup TerminalMode
        autocmd!
        autocmd BufWinEnter,WinEnter term://* startinsert
        autocmd BufLeave term://* stopinsert
    augroup END
]], false)

vim.cmd [[
    autocmd FileType * setlocal formatoptions-=cro
]]

vim.api.nvim_create_autocmd("TermOpen", {
  command = "setlocal nonu nornu signcolumn=no"
})

require("core.lazy")
require("core.highlight").setup()
