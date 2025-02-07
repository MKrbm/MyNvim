return {
    {
        "akinsho/toggleterm.nvim",
        lazy = false,
        cmd = {
            "ToggleTerm", "ToggleTermSetName", "ToggleTermToggleAll",
            "ToggleTermSendVisualLines", "ToggleTermSendCurrentLine",
            "ToggleTermSendVisualSelection"
        },
        opts = {
            size = function(term)
                if term.direction == "horizontal" then
                    return vim.o.lines * 0.25
                elseif term.direction == "vertical" then
                    print("Im in vertical")
                    return vim.o.columns * 0.40
                end
            end,
            on_open = function()
                vim.api.nvim_set_option_value("foldmethod", "manual",
                                              {scope = "local"})
                vim.api
                    .nvim_set_option_value("foldexpr", "0", {scope = "local"})
            end,
            highlights = {
                -- Normal = {
                -- guibg = "#1e222a",
                -- },
                NormalFloat = {
                    link = "NormalNC"
                    -- guibg = "#1e222a",
                },
                FloatBorder = {
                    link = "NormalNC"
                    -- guibg = "#1e222a",
                }
            },
            open_mapping = false, -- [[<c-\>]],
            hide_numbers = true, -- hide the number column in toggleterm buffers
            shade_filetypes = {},
            shade_terminals = false,
            shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
            start_in_insert = true,
            persist_mode = false,
            insert_mappings = true, -- whether or not the open mapping applies in insert mode
            persist_size = true,
            direction = "horizontal",
            close_on_exit = true, -- close the terminal window when the process exits
            shell = vim.o.shell, -- change the default shell
            float_opts = {
                -- see :h nvim_open_win for details on borders however
                border = "curved",
                width = function()
                    return math.floor(vim.o.columns * 0.8)
                end,
                height = function()
                    return math.floor(vim.o.lines * 0.8)
                end,
                zindex = 3
            }
        }
    }
}
