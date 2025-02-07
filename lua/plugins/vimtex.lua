local global = require("core.global")

return {

    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_quickfix_enabled = 1 -- Enable it if you want to show log when compile finished
            vim.g.vimtex_compiler_latexmk = {
                aux_dir = "./aux",
                out_dir = "./out"
            }
            if global.is_mac then
                vim.g.vimtex_indent_enabled = 0
                vim.g.vimtex_view_method = "skim"
                vim.g.vimtex_view_skim_activate = 1
                vim.g.vimtex_view_skim_sync = 1 -- Value 1 allows forward search after every successful compilation
            else -- if global.is_linux then
                vim.g.vimtex_view_general_viewer = "okular"
                vim.g.vimtex_view_general_options =
                    "--unique file:@pdf\\#src:@line@tex"
            end
        end
    }
}
