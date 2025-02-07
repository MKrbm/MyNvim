return {
    {
        "folke/trouble.nvim",
        cmd = {"Trouble"},
        opts = {modes = {lsp = {win = {position = "right"}}}},
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)"
            }, {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)"
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle<cr>",
                desc = "Symbols (Trouble)"
            }, {
                "<leader>cS",
                "<cmd>Trouble lsp toggle<cr>",
                desc = "LSP references/definitions/... (Trouble)"
            }, {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)"
            }, {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)"
            }, {
                "[q",
                function()
                    if require("trouble").is_open() then
                        require("trouble").prev({
                            skip_groups = true,
                            jump = true
                        })
                    else
                        local ok, err = pcall(vim.cmd.cprev)
                        if not ok then
                            vim.notify(err, vim.log.levels.ERROR)
                        end
                    end
                end,
                desc = "Previous Trouble/Quickfix Item"
            }, {
                "]q",
                function()
                    if require("trouble").is_open() then
                        require("trouble").next({
                            skip_groups = true,
                            jump = true
                        })
                    else
                        local ok, err = pcall(vim.cmd.cnext)
                        if not ok then
                            vim.notify(err, vim.log.levels.ERROR)
                        end
                    end
                end,
                desc = "Next Trouble/Quickfix Item"
            }
        }
    }, -- Finds and lists all of the TODO, HACK, BUG, etc comment
    -- in your project and loads them into a browsable list.
    -- {
    --     "folke/todo-comments.nvim",
    --     cmd = {"TodoTrouble", "TodoTelescope"},
    --     event = "LazyFile",
    --     opts = {},
    --     -- stylua: ignore
    --     keys = {
    --         {
    --             "]t",
    --             function() require("todo-comments").jump_next() end,
    --             desc = "Next Todo Comment"
    --         }, {
    --             "[t",
    --             function() require("todo-comments").jump_prev() end,
    --             desc = "Previous Todo Comment"
    --         },
    --         {
    --             "<leader>xt",
    --             "<cmd>Trouble todo toggle<cr>",
    --             desc = "Todo (Trouble)"
    --         }, {
    --             "<leader>xT",
    --             "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>",
    --             desc = "Todo/Fix/Fixme (Trouble)"
    --         }, {"<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo"}, {
    --             "<leader>sT",
    --             "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",
    --             desc = "Todo/Fix/Fixme"
    --         }
    --     }
    -- }, 
    {
        "folke/which-key.nvim",
        keys = {"<leader>", '"', "'", "`", "c", "v", "g"},
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 600
        end,
        config = function(_, opts)
            require("which-key").setup({
                popup_mappings = {scroll_down = "<c-e>", scroll_up = "<c-y>"},
                triggers_blacklist = {n = {"m"}, i = {"j", "k"}, v = {"j", "k"}}
            })
        end
    }, 


    {
        "nvim-tree/nvim-tree.lua",
        cmd = {"NvimTreeToggle", "NvimTreeFocus"},
        lazy = false,
        init = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
        opts = function()
            local opt = require("plugins/configs/nvimtree")
            return opt
        end
    } -- mason.nvim
}
