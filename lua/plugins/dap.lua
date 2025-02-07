return {
    {
        "mfussenegger/nvim-dap",
        lazy = false,
        dependencies = {
            "mfussenegger/nvim-dap-python", "rcarriga/nvim-dap-ui",
            "jay-babu/mason-nvim-dap.nvim", "nvim-neotest/nvim-nio"
        },

        config = function()
            local dap = require("dap")
            local command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7"
            dap.configurations.cpp = {
                {
                    name = "Debug with codelldb",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input({
                            prompt = "Hi there! Path to cpp executable: ",
                            default = vim.fn.getcwd() .. "/",
                            completion = "file"
                        })
                    end,
                    cwd = "/Users/keisukemurota/Documents/todo/worms/Debug",
                    stopOnEntry = false,
                    showDisassembly = "never",
                    args = {}
                }
            }
        end
    },

    -- mason-nvim-dap.nvim closes some gaps that exist between mason.nvim and nvim-dap. Its main responsibilities are:
    -- provide extra convenience APIs such as the :DapInstall command
    -- allow you to (i) automatically install, and (ii) automatically set up a predefined list of adapters
    -- translate between dap adapter names and mason.nvim package names (e.g. python <-> debugpy)
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            require("mason-nvim-dap").setup({
                automatic_setup = true,
                handlers = {
                    function(config)
                        require("mason-nvim-dap").default_setup(config)
                    end
                }
            })
        end
    }, 
    {
        "mfussenegger/nvim-dap-python",
        lazy = false,
        config = function()
            local venv = os.getenv("VIRTUAL_ENV")
            local command = string.format("%s/bin/python", venv)
            require("dap-python").setup(command)
        end
    }, 
    {
        "rcarriga/nvim-dap-ui",
        lazy = true,
        opts = {},
        config = function(_, opts)
            -- setup dap config by VsCode launch.json file
            -- require("dap.ext.vscode").load_launchjs()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup(opts)
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open({})
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close({})
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close({})
            end
        end
    }, 
    {"nvim-tree/nvim-web-devicons"}

}
