-- Simplified function to set keybindings
local function set_keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  for k, v in pairs(opts) do
    options[k] = v
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Normal mode keybindings
set_keymap("n", "<leader>ss", "<cmd> SessionSave <CR>", { desc = "Save session" })
set_keymap("n", "<leader>sl", "<cmd> SessionLoad <CR>", { desc = "Load session" })
set_keymap("n", "zk", "<CMD> call append(line('.')-1, '') <CR>", { desc = "Insert line above" })
set_keymap("n", "zj", "<CMD> call append(line('.'), '') <CR>", { desc = "Insert line below" })
set_keymap("n", "#", "^", { desc = "Go to start of line" })
set_keymap("n", "^", "#", { desc = "Search for word under cursor" })
set_keymap({"n", "v"}, "<leader>[", "gg", { desc = "Go to top of file" })
set_keymap({"n", "v"}, "<leader>]", "G", { desc = "Go to end of file" })
set_keymap("n", "\\q", "<CMD>q<CR>", { desc = "Quit current window" })
set_keymap("n", "<M-q>", "<CMD>bd<CR>", { desc = "Quit buffer" })
set_keymap("n", "<leader>h", "<CMD>sp<CR>", { desc = "Split window horizontally" })
set_keymap("n", "<leader>v", "<CMD>vs<CR>", { desc = "Split window vertically" })
set_keymap("n", "<C-Up>", "<CMD>resize +2<CR>", { desc = "Increase window height" })
set_keymap("n", "<C-Down>", "<CMD>resize -2<CR>", { desc = "Decrease window height" })
set_keymap("n", "<C-Right>", "<CMD>vertical resize +2<CR>", { desc = "Increase window width" })
set_keymap("n", "<C-Left>", "<CMD>vertical resize -2<CR>", { desc = "Decrease window width" })
set_keymap("n", "<A-j>", "<CMD>tabprevious<CR>", { desc = "Previous tab" })
set_keymap("n", "<A-k>", "<CMD>tabnext<CR>", { desc = "Next tab" })
set_keymap("n", "\\n", "<CMD>tab split<CR>", { desc = "Open new tab" })
set_keymap("n", "\\x", "<CMD>tabclose<CR>", { desc = "Close tab" })
set_keymap("n", "<S-j>", "<CMD>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
set_keymap("n", "<S-k>", "<CMD>BufferLineCycleNext<CR>", { desc = "Next buffer" })
set_keymap("n", "\\k", "<S-k>", { desc = "Shifted up key binding" })
set_keymap(
  "n",
  "<leader>su",
  '<Cmd>lua require("which-key").show("z=", {mode = "n", auto = true})<CR>',
  { desc = "Which key" }
)
set_keymap("n", "<leader>sg", "zg", { desc = "Mark word as good" })
set_keymap("n", "<leader>sr", "zug", { desc = "Remove word from good list" })
set_keymap("n", ";", "<Plug>(clever-f-repeat-forward)", { desc = "Clever forward" })
set_keymap("n", ",", "<Plug>(clever-f-repeat-back)", { desc = "Clever back" })
set_keymap("n", "<leader>xa", ":wa<CR>:qa<CR>", { desc = "Save all and quit" })
set_keymap("n", "\\t", "<CMD>terminal<CR>", { desc = "Open terminal" })
set_keymap("n", "<M-e>", "j<C-e>", { desc = "Move down and scroll" })
set_keymap("n", "<M-y>", "k<C-y>", { desc = "Move up and scroll" })
set_keymap("n", "<leader>j", "<S-j>", { desc = "Shifted down key binding" })
set_keymap("n", "<leader>k", "a<CR><Esc>k$", { desc = "Insert new line above" })
set_keymap("n", "q", "", { desc = "Unmap q" })
set_keymap("n", "<leader>q", "q", { desc = "Original q functionality" })
set_keymap("n", "<leader>2", "@", { desc = "Execute register" })
set_keymap("n", "<S-M-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
set_keymap("n", "<S-M-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })

--extend operator-pending selection
set_keymap("x", "il", "g_o^", { desc = "Select to start of line", nowait = true, noremap = true})
set_keymap("x", "al", "$o^", { desc = "Select to end of line", nowait = true, noremap = true})
set_keymap("x", "ip", "i[", { desc = "Select inside parentheses" })
set_keymap("x", "ap", "a[", { desc = "Select around parentheses" })
set_keymap("x", "iP", "ip", { desc = "Select inner paragraph" })
set_keymap("x", "aP", "ap", { desc = "Select entire paragraph" })
set_keymap("x", "ia", 'i"', { desc = "Inner double quotes" })
set_keymap("x", "aa", 'a"', { desc = "Around double quotes" })
set_keymap("x", "is", "i'", { desc = "Inner single quotes" })
set_keymap("x", "as", "a'", { desc = "Around single quotes" })
set_keymap("x", "ik", "iB", { desc = "Inner {}" })
set_keymap("x", "ak", "aB", { desc = "Around {}" })
set_keymap("o", "il", ":normal vil<CR>", { desc = "Select to start of line", nowait = true, noremap = true })
set_keymap("o", "al", ":normal val<CR>", { desc = "Select to end of line", nowait = true, noremap = true })
set_keymap("o", "ip", "i[", { desc = "Select inside parentheses" })
set_keymap("o", "ap", "a[", { desc = "Select around parentheses" })
set_keymap("o", "iP", "ip", { desc = "Select inner paragraph" })
set_keymap("o", "aP", "ap", { desc = "Select entire paragraph" })
set_keymap("o", "ia", 'i"', { desc = "Inner double quotes", noremap = true, silent = true })
set_keymap("o", "aa", 'a"', { desc = "Around double quotes", noremap = true, silent = true })
set_keymap("o", "is", "i'", { desc = "Inner single quotes", noremap = true, silent = true })
set_keymap("o", "as", "i'", { desc = "Around single quotes", noremap = true, silent = true })
set_keymap("o", "ik", "iB", { desc = "Inner {}" })
set_keymap("o", "ak", "aB", { desc = "Around {}" })

-- Visual mode keybindings
set_keymap("v", "#", "^", { desc = "Start of line" })
set_keymap("v", "^", "#", { desc = "Search for word under cursor" })
-- set_keymap("v", "<space>[", "[[", { desc = "Previous function start" })
-- set_keymap("v", "<space>]", "]]", { desc = "Next function start" })
-- set_keymap("v", "[{", "[m", { desc = "Previous method/function start" })
-- set_keymap("v", "[}]", "[]", { desc = "Next method/function start" })
set_keymap("v", ";", "<Plug>(clever-f-repeat-forward)", { desc = "Clever forward" })
set_keymap("v", ",", "<Plug>(clever-f-repeat-back)", { desc = "Clever back" })
set_keymap("v", "<leader>d", '"_d', { desc = "Delete without yank" })
set_keymap("v", "<leader>j", "<S-j>", { desc = "Shifted down key binding" })
set_keymap("v", "<s-j>", "", { desc = "Unmap shifted down" })
set_keymap("v", "<S-M-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
set_keymap("v", "<S-M-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Terminal mode keybindings
set_keymap("t", "<C-x>", "<C-\\><C-N>", { desc = "Escape terminal mode" })
set_keymap("t", "<Esc>", "<C-\\><C-N>", { desc = "Escape terminal mode", nowait = true })
set_keymap("t", "<C-h>", "<C-x><C-w>h", { desc = "Move to left split", remap = true })
set_keymap("t", "<C-l>", "<C-x><C-w>l", { desc = "Move to right split", remap = true })
set_keymap("t", "<C-j>", "<C-x><C-w>j", { desc = "Move to bottom split", remap = true })
set_keymap("t", "<C-k>", "<C-x><C-w>k", { desc = "Move to top split", remap = true })
set_keymap("t", "<C-e>", "<C-x><C-e>", { desc = "Scroll up", remap = true })
set_keymap("t", "<C-y>", "<C-x><C-y>", { desc = "Scroll down", remap = true })
set_keymap("t", "<A-j>", "<CMD>tabprevious<CR>", { noremap = true, desc = "<CMD>tabprevious<CR>" })
set_keymap("t", "<A-k>", "<CMD>tabnext<CR>", { noremap = true, desc = "<CMD>tabnext<CR>" })

-- Window resizing
set_keymap("n", "<C-Up>", "<CMD>resize +2<CR>", { desc = "Height up" })
set_keymap("n", "<C-Down>", "<CMD>resize -2<CR>", { desc = "Height down" })

-- Insert mode keybindings
set_keymap("i", "<A-]>", "<C-t>", { desc = "Indent line" })
set_keymap("i", "<A-[>", "<C-d>", { desc = "De-indent line" })
set_keymap("i", "<A-j>", "<Down>", { desc = "Move cursor down" })
set_keymap("i", "<A-k>", "<Up>", { desc = "Move cursor up" })
set_keymap("i", "<A-h>", "<Left>", { desc = "Move cursor left" })
set_keymap("i", "<A-l>", "<Right>", { desc = "Move cursor right" })
set_keymap("i", "<S-M-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
set_keymap("i", "<S-M-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
set_keymap("i", "<C-d>", "<Del>", { desc = "Delete world front" })
set_keymap("i", "<C-b>", "<Del>", { desc = "Delete world front" })
set_keymap("i", "<C-e>", "<Del>", { desc = "Delete world front" })
set_keymap("i", "<C-h>", "<Left>", { desc = "Move left" })
set_keymap("i", "<C-l>", "<Right>", { desc = "Move right" })
set_keymap("i", "<C-k>", "<Up>", { desc = "Move up" })
set_keymap("i", "<C-j>", "<Down>", { desc = "Move down" })
set_keymap("i", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save file" })
set_keymap("i", "<C-p>", "", { desc = "Naitive autocmp" })
set_keymap("i", "<C-n>", "", { desc = "Naitive autocmp" })
set_keymap("i", "<M-p>", "<C-p>", { desc = "Naitive autocmp" })
set_keymap("i", "<M-n>", "<C-n>", { desc = "Naitive autocmp" })

-- Operator-pending mode keybindings
set_keymap("o", "#", "^", { desc = "Start of line" })
set_keymap("o", "^", "#", { desc = "Search for word under cursor" })

-- Standard keybindings
set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
set_keymap("n", "<leader>xa", ":wa<CR>:qa<CR>", { desc = "Save all and quit" })

-- Plugins
-- Telescope key mappings
set_keymap("n", "<leader>fm", ":Telescope harpoon marks<CR>", { desc = "show harpoon marks" })
set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
set_keymap(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "Find files with advanced options" }
)
set_keymap("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "List buffers" })
set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find help tags" })
set_keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Find old files" })
set_keymap("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Fuzzy find in current buffer" })
set_keymap(
  "n",
  "<leader>fz",
  ":lua require('telescope.builtin').live_grep({ prompt_title = 'Find in current buffer', search_dirs = {'%:p'} })<CR>",
  { desc = "Live grep in current directory" }
)
set_keymap("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "List git commits" })
set_keymap("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
set_keymap("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "List terminal sessions" })
set_keymap("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "Choose theme" })
set_keymap("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "List marks" })
set_keymap("n", "<leader>fl", ":Telescope resume<CR>", { desc = "Resume last Telescope" })
set_keymap("n", "<leader>sf", ":Telescope persisted<CR>", { desc = "Persisted search" })

-- nvim-tree
set_keymap("n", "<C-n>", ":lua require('nvim-tree.api').tree.toggle()<CR>", { desc = "Toggle NvimTree" })
set_keymap("n", "<leader>e", ":NvimTreeFindFile<CR>", { desc = "Find file in NvimTree" })

-- Comment
set_keymap(
  "n",
  "<leader>/",
  ":lua require('Comment.api').toggle.linewise.current()<CR>",
  { desc = "Toggle comment (line)" }
)
set_keymap(
  "v",
  "<leader>/",
  "<ESC>:lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Toggle comment (visual)" }
)

-- Undotree keybindings
set_keymap("n", "\\ut", "<CMD>UndotreeToggle<CR>", { desc = "Undotree toggle" })
set_keymap("n", "\\uh", "<CMD>UndotreeHide<CR>", { desc = "Undotree hide" })

-- lsp
set_keymap("n", "\\fm", function() vim.lsp.buf.format({ async = true }) end, { desc = "Undotree toggle" })
set_keymap("n", "gd", function() vim.lsp.buf.definition() end, { desc = "LSP definition" })
set_keymap("n", "gD", function() vim.lsp.buf.declaration() end, { desc = "LSP declaration" })
set_keymap("n", "gK", function() vim.lsp.buf.hover() end, { desc = "LSP hover" })
set_keymap("n", "gI", function() vim.lsp.buf.implementation() end, { desc = "LSP implementation" })
set_keymap("n", "<leader>ls", function() vim.lsp.buf.signature_help() end, { desc = "LSP signature help" })
set_keymap("n", "<leader>D", function() vim.lsp.buf.type_definition() end, { desc = "LSP definition type" })
-- set_keymap("n", "<leader>ra", function() require("nvchad.renamer").open() end, { desc = "LSP rename" })
set_keymap({"n", "v"}, "<leader>ca",function() vim.lsp.buf.code_action() end, { desc = "LSP code action" })
set_keymap("n", "gr", function() vim.lsp.buf.references() end, { desc = "LSP references" })
set_keymap("n", "<leader>se", function() vim.diagnostic.open_float { border = "rounded" } end,
  { desc = "show Floating diagnostic" })
set_keymap("n", "[d", function() vim.diagnostic.goto_prev { float = { border = "rounded" } } end, { desc = "Goto prev" })
set_keymap("n", "]d", function() vim.diagnostic.goto_next { float = { border = "rounded" } } end, { desc = "Goto next" })
set_keymap("n", "<leader>q", function() vim.diagnostic.setloclist() end, { desc = "Diagnostic setloclist" })
set_keymap("n", "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end, { desc = "Add workspace folder" })
set_keymap("n", "<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end, { desc = "Remove workspace folder" })
set_keymap("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
  { desc = "List workspace folders" })

-- nvim-hop for normal mode
set_keymap("n", "G", "<cmd> HopPatternMW <CR>", { silent = true, noremap = true, desc = "nvim-hop Pattern" })
set_keymap("n", "gg", "<cmd> HopChar2MW <CR>", { silent = true, noremap = true, desc = "nvim-hop char2" })
set_keymap("n", "gk", "<cmd> HopLineMW <CR>", { silent = true, noremap = true, desc = "nvim-hop jump to line" })
set_keymap("n", "gw", "<cmd> HopWordMW <CR>", { silent = true, noremap = true, desc = "nvim-hop jump to word" })
set_keymap("n", "gs", "<cmd> HopChar1MW <CR>", { silent = true, noremap = true, desc = "nvim-hop char1" })
-- nvim-hop for visual mode
set_keymap("v", "G", "<cmd> HopPatternMW <CR>", { silent = true, noremap = true, desc = "nvim-hop Pattern" })
set_keymap("v", "gg", "<cmd> HopChar2MW <CR>", { silent = true, noremap = true, desc = "nvim-hop char2" })
set_keymap("v", "gk", "<cmd> HopLineMW <CR>", { silent = true, noremap = true, desc = "nvim-hop jump to line" })
set_keymap("v", "gw", "<cmd> HopWordMW <CR>", { silent = true, noremap = true, desc = "nvim-hop jump to word" })
set_keymap("v", "gs", "<cmd> HopChar1MW <CR>", { silent = true, noremap = true, desc = "nvim-hop char1" })
-- nvim-hop for operator-pending mode
set_keymap("o", "G", "<cmd> HopPatternMW <CR>", { silent = true, noremap = true, desc = "nvim-hop Pattern " })
set_keymap("o", "gg", "<cmd> HopChar2MW <CR>", { silent = true, noremap = true, desc = "nvim-hop char2" })
set_keymap("o", "gk", "<cmd> HopLineMW <CR>", { silent = true, noremap = true, desc = "nvim-hop jump to line" })
set_keymap("o", "gw", "<cmd> HopWordMW <CR>", { silent = true, noremap = true, desc = "nvim-hop jump to word" })
set_keymap("o", "gs", "<cmd> HopChar1MW <CR>", { silent = true, noremap = true, desc = "nvim-hop char1" })

--diffview
set_keymap("n", "<leader>gd", "<CMD> DiffviewOpen <CR>", { desc = "Diffview open" })
set_keymap("n", "<leader>gc", "<CMD> DiffviewClose <CR>", { desc = "Diffview close" })

-- toggle term
set_keymap("n", "<M-i>", "<CMD> 100ToggleTerm direction=float <CR>", { desc = "open float terminal" })
set_keymap("t", "<M-i>", "<CMD> 100ToggleTerm direction=float <CR>", { desc = "open float terminal" })
set_keymap("n", "<c-f>", "<CMD> 200ToggleTerm direction=horizontal <CR>", { desc = "open horizontal terminal" })
set_keymap("t", "<c-f>", "<CMD> 200ToggleTerm direction=horizontal <CR>", { desc = "open horizontal terminal" })
set_keymap("n", "\\v", "<CMD> 300ToggleTerm direction=vertical <CR>", { desc = "open vertical terminal" })
set_keymap("t", "\\v", "<CMD> 300ToggleTerm direction=vertical <CR>", { desc = "open vertical terminal" })

-- cmake
set_keymap("n", "\\g", "<CMD> CMakeGenerate <CR>", { desc = "generate cmake" })
set_keymap("n", "\\b", "<CMD> CMakeBuild <CR>", { desc = "build cmake" })
set_keymap("n", "\\cc", "<CMD> CMakeClose <CR>", { desc = "close cmake " })
set_keymap("n", "\\cs", "<CMD> CMakeStop <CR>", { desc = "stop cmake " })
set_keymap("n", "\\co", "<CMD> CMakeOpen <CR>", { desc = "Open cmake" })
set_keymap("n", "\\ct", "<CMD> CMakeSelectBuildTarget <CR>", { desc = "Select Build target" })
set_keymap("n", "\\cb", "<CMD> CMakeSelectBuildType <CR>", { desc = "Select Build type" })

-- leap
set_keymap({'n', 'x', 'o'}, 'w', "<Plug>(leap-forward-to)", { desc = "leap forward" } )
set_keymap({'n', 'x', 'o'}, '<s-w>', "<Plug>(leap-backward-to)", { desc = "leap backward" } )
set_keymap({'n', 'x', 'o'}, 'gs', "<Plug>(leap-from-window)", { desc = "leap from window" } )

-- cmp
set_keymap("i", '<C-i>', '<Cmd> lua require("cmp").complete()<CR>', { desc = "open complete" } )
