return {
    {
        "neovim/nvim-lspconfig",
        event = {"BufReadPre", "BufNewFile"},
        dependencies = {
            "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", {
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    require("plugins.configs.null-ls")
                end
            }
        },
        config = function() require("plugins.configs.lspconfig") end
    }, {
        "williamboman/mason.nvim",
        -- cmd = "Mason",
        keys = {{"<leader>cm", "<cmd>Mason<cr>", desc = "Mason"}},
        cmd = {"Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate"},
        opts = {
            ensure_installed = {
                "prettier", "stylua", "deno", "clang-format", "black", "flake8",
                "mypy"
            }
        },
        config = function(_, opts)
            vim.api.nvim_create_user_command("MasonInstallAll", function()
                print(vim.inspect(opts.ensure_installed))
                vim.cmd("MasonInstall " ..
                            table.concat(opts.ensure_installed, " "))
            end, {})
            vim.g.mason_binaries_list = opts.ensure_installed
            require("mason").setup(opts)
        end
    } -- neovim/nvim-lspconfig
}
