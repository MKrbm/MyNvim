return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {"nvim-treesitter/nvim-treesitter"}, {
                "olimorris/persisted.nvim",
                lazy = true,
                cmd = {
                    "SessionToggle", "SessionStart", "SessionStop",
                    "SessionSave", "SessionLoad", "SessionLoadLast",
                    "SessionLoadFromFile", "SessionDelete"
                },
                config = require("plugins.configs.persisted")
            }
        },
        cmd = "Telescope",
        opts = function() return require("plugins.configs.telescope") end,
        config = function(_, opts)
            require("telescope").load_extension("persisted")
            require("telescope").load_extension("harpoon")
            local telescope = require("telescope")
            telescope.setup(opts)
        end
    }
}
