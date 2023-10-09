local g = vim.g
local opt = vim.opt
local global = require("core.global")

local clipboard_config = function()
	if global.is_mac then
		vim.g.clipboard = {
			name = "macOS-clipboard",
			copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
			paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
			cache_enabled = 0,
		}
	elseif global.is_wsl then
		vim.g.clipboard = {
			name = "win32yank-wsl",
			copy = {
				["+"] = "win32yank.exe -i --crlf",
				["*"] = "win32yank.exe -i --crlf",
			},
			paste = {
				["+"] = "win32yank.exe -o --lf",
				["*"] = "win32yank.exe -o --lf",
			},
			cache_enabled = 0,
		}
	end
end

local shell_config = function()
	if global.is_windows then
    print("windows are not supported")
	end
  if global.is_linux then
    opt.shell = "/bin/bash"
  end
  if global.is_mac then
    opt.shell = "/bin/zsh"
  end
end

clipboard_config()
shell_config()

-- disable netrw at the very start of your init.lua
-- g.loaded_netrw = 1
-- g.loaded_netrwPlugin = 1
g.mapleader = " "

-- options	

-- opt.shell = "/bin/zsh"
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
