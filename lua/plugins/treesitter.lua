return {
    {
        "nvim-treesitter/nvim-treesitter",
        cmd = {"TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo"},
        build = ":TSUpdate",
        lazy = false,
        opts = function() return require("plugins.configs.treesitter") end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
        dependencies = {
            {"drybalka/tree-climber.nvim"}, {"mfussenegger/nvim-treehopper"}, {
                "HiPhish/rainbow-delimiters.nvim",
                config = function()
                    require("rainbow-delimiters.setup").setup({
                        query = {
                            [''] = 'rainbow-delimiters',
                            lua = 'rainbow-blocks'
                        },
                        priority = {[''] = 110, lua = 210},
                        highlight = {
                            "RainbowDelimiterRed", "RainbowDelimiterYellow",
                            "RainbowDelimiterBlue", "RainbowDelimiterOrange",
                            "RainbowDelimiterGreen", "RainbowDelimiterViolet",
                            "RainbowDelimiterCyan"
                        }
                    })
                end
            }, {"nvim-treesitter/nvim-treesitter-textobjects", lazy = false}
        }
    }
}
