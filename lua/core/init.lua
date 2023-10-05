local g = vim.g
local opt = vim.opt

-- disable netrw at the very start of your init.lua
-- g.loaded_netrw = 1
-- g.loaded_netrwPlugin = 1
g.mapleader = " "

-- options	

opt.shell = "/bin/bash"
opt.laststatus = 3 -- global statusline
opt.showmode = false
-- opt.clipboard = "unnamedplus" -- copy paste automatically to system clipboard
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.softtabstop = 2
opt.tabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.undofile = true
opt.laststatus = 2
opt.splitkeep = "screen"
-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

g.mapleader = " "

-- autocommand
vim.api.nvim_exec([[
  augroup NvimTreeCursorColumn
      autocmd!
      autocmd FileType NvimTree setlocal nocursorcolumn
  augroup END
]], false)

vim.cmd [[
  autocmd FileType * setlocal formatoptions-=cro
]]

vim.api.nvim_create_autocmd("TermOpen", {command = "setlocal nonu nornu signcolumn=no"})

require("core.lazy")
require("core.highlight").setup()
