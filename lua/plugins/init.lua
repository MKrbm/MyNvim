return {

	"nvim-lua/plenary.nvim",

	{
		"folke/which-key.nvim",
		keys = { "<leader>", '"', "'", "`", "c", "v", "g" },
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 600
		end,
		config = function(_, opts)
			require("which-key").setup({
				popup_mappings = {
					scroll_down = "<c-e>",
					scroll_up = "<c-y>",
				},
				triggers_blacklist = {
					n = { "m" },
					i = { "j", "k" },
					v = { "j", "k" },
				},
			})
		end,
	},

	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	{
		"folke/neodev.nvim",
		opts = {
			library = {
				plugins = { { "nvim-dap-ui" }, type = true },
			},
		},
	},

	{
		"mfussenegger/nvim-dap",
		lazy = false,
		dependencies = {
			"mfussenegger/nvim-dap-python",
			"rcarriga/nvim-dap-ui",
			"jay-babu/mason-nvim-dap.nvim",
		},

		config = function()
			local dap = require("dap")

			local command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7"
			dap.adapters.codelldb = {
				args = {"-"},
			}

			dap.configurations.cpp = {
				{
					name = "Debug with gdb",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input({
							prompt = "Hi there! Path to cpp executable: ",
							default = vim.fn.getcwd() .. "/",
							completion = "file",
						})
					end,
					cwd = "/Users/keisukemurota/Documents/todo/worms/Debug",
					stopOnEntry = false,
				},
			}
		end,
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("mason-nvim-dap").setup({
				automatic_setup = true,
				handlers = {
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,
				},
			})
		end,
	},

	{
		"mfussenegger/nvim-dap-python",
		lazy = false,
		config = function()
			local venv = os.getenv("VIRTUAL_ENV")
			local command = string.format("%s/bin/python", venv)
			require("dap-python").setup(command)
		end,
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
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		lazy = false,
		init = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			vim.opt.termguicolors = true
		end,
		opts = function()
			local opt = require("plugins/configs/nvimtree")
			return opt
		end,
	},

	{
		"williamboman/mason.nvim",
		-- cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = {
			ensure_installed = {
				"prettier",
				"stylua",
				"deno",
				"clang-format",
				"black",
				"flake8",
				"mypy",
			},
		},
		config = function(_, opts)
			vim.api.nvim_create_user_command("MasonInstallAll", function()
				print(vim.inspect(opts.ensure_installed))
				vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
			end, {})
			vim.g.mason_binaries_list = opts.ensure_installed
			require("mason").setup(opts)
		end,
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("plugins.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			return require("plugins.configs.treesitter")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
		dependencies = {
			{
				"drybalka/tree-climber.nvim",
			},
			{
				"mfussenegger/nvim-treehopper",
			},
			{
				"HiPhish/rainbow-delimiters.nvim",
				config = function()
					require("rainbow-delimiters.setup")({
						highlight = {
							"rainbow1",
							"rainbow2",
							"rainbow3",
							"rainbow4",
							"rainbow5",
							"rainbow6",
							"rainbow7",
						},
						blacklist = {},
					})
				end,
			},
			-- {
			--   "nvim-treesitter/nvim-treesitter-textobjects",
			--   lazy = false,
			-- },
		},
	},

	{
		"chipsenkbeil/distant.nvim",
		branch = "v0.3",
		lazy = false,
		config = function()
			require("distant"):setup()
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter",
			},
			{
				"olimorris/persisted.nvim",
				lazy = true,
				cmd = {
					"SessionToggle",
					"SessionStart",
					"SessionStop",
					"SessionSave",
					"SessionLoad",
					"SessionLoadLast",
					"SessionLoadFromFile",
					"SessionDelete",
				},
				config = require("plugins.configs.persisted"),
			},
		},
		cmd = "Telescope",
		opts = function()
			return require("plugins.configs.telescope")
		end,
		config = function(_, opts)
			require("telescope").load_extension("persisted")
			require("telescope").load_extension("harpoon")
			local telescope = require("telescope")
			telescope.setup(opts)
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		version = "2.20.8",
	},

	"nvim-tree/nvim-web-devicons",

	{
		"mbbill/undotree",
		lazy = true,
		cmd = { "UndotreeToggle" },
		config = function()
			vim.g.undotree_WindowLayout = 2
		end,
	},

	{
		"numToStr/Comment.nvim",
		keys = {
			{ "\\\\gcc", mode = "n",          desc = "Comment toggle current line" },
			{ "\\\\gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
			{ "\\\\gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
			{ "\\\\gbc", mode = "n",          desc = "Comment toggle current block" },
			{ "\\\\gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
			{ "\\\\gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
		},
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},

	{
		"rhysd/clever-f.vim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		config = require("plugins.configs.clever-f"),
	},

	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		opts = function()
			return {
				options = {
					-- theme = "everforest",
					theme = "ayu_dark",
				},
			}
		end,
		config = function(_, opts)
			require("lualine").setup(opts)
		end,
	},
	{
		"ThePrimeagen/harpoon",
		keys = require("config.harpoon"),
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				-- dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("luasnip").config.set_config(opts)
					-- snipmate format
					require("luasnip.loaders.from_snipmate").load()
					require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.g.snipmate_snippets_path or "" })
					-- lua format
					require("luasnip.loaders.from_lua").load()
					require("luasnip.loaders.from_lua").lazy_load({ paths = vim.g.lua_snippets_path or "" })
					vim.api.nvim_create_autocmd("InsertLeave", {
						callback = function()
							if
									require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
									and not require("luasnip").session.jump_active
							then
								require("luasnip").unlink_current()
							end
						end,
					})
				end,
			},
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
			},
			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
			},
		},
		opts = function()
			return require("plugins.configs.cmp")
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},

	{
		"zbirenbaum/copilot.lua",
		lazy = true,
		cmd = "Copilot",
		event = "InsertEnter",
		config = require("plugins.configs.copilot"),
	},

	{ "tpope/vim-surround", lazy = false },

	{
		"sindrets/diffview.nvim",
		lazy = true,
		cmd = { "DiffviewOpen", "DiffviewClose" },
		opts = {
			view = {
				default = {
					layout = "diff2_vertical",
				},
				merge_tool = {
					layout = "diff3_mixed",
				},
			},
		},
	},

	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		build = ":call mkdp#util#install()",
	},

	{
		"chentoast/marks.nvim",
		lazy = false,
		config = function()
			require("marks").setup({
				mappings = {
					set_next = "m,",
					next = "m]",
					preview = "m:",
					set_bookmark0 = "m0",
					prev = false, -- pass false to disable only this default mapping
				},
			})
		end,
	},

	{
		"phaazon/hop.nvim",
		lazy = false,
		config = function()
			require("hop").setup({
				case_insensitive = false,
				char2_fallback_key = "<CR>",
				quit_key = "<Esc>",
			})
		end,
	},

	{
		"ggandor/leap.nvim",
		lazy = false,
		dependencies = {
			"tpope/vim-repeat",
		},
		config = function()
			-- require("leap").add_repeat_mappings(";", ",", {
			--   relative_directions = true,
			--   modes = { "n", "x", "o" },
			-- })
			require("leap").setup({
				safe_labels = {
					-- "a","s", "d","f","j","k","l","w","e","r","u","i","o","p","g","h","t","y","v","b","n","m","z","x","c","q", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
					-- "/", ",","."
				},
			})
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		lazy = false,
		cmd = {
			"ToggleTerm",
			"ToggleTermSetName",
			"ToggleTermToggleAll",
			"ToggleTermSendVisualLines",
			"ToggleTermSendCurrentLine",
			"ToggleTermSendVisualSelection",
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
				vim.api.nvim_set_option_value("foldmethod", "manual", { scope = "local" })
				vim.api.nvim_set_option_value("foldexpr", "0", { scope = "local" })
			end,
			highlights = {
				-- Normal = {
				-- guibg = "#1e222a",
				-- },
				NormalFloat = {
					link = "NormalNC",
					-- guibg = "#1e222a",
				},
				FloatBorder = {
					link = "NormalNC",
					-- guibg = "#1e222a",
				},
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
				zindex = 3,
			},
		},
	},

	{
		"Civitasv/cmake-tools.nvim",
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
			},
		},
		lazy = true,
		cmd = {
			"CMakeBuild",
			"CMakeClean",
			"CMakeConfigure",
			"CMakeInstall",
			"CMakeTest",
			"CMakeToggle",
			"CMakeRun",
			"CMakeOpen",
			"CMakeGenerate",
		},
		config = function()
			require("cmake-tools").setup({
				cmake_command = "cmake",                                      -- this is used to specify cmake command path
				cmake_regenerate_on_save = false,                             -- auto generate when save CMakeLists.txt
				cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
				cmake_build_options = {},                                     -- this will be passed when invoke `CMakeBuild`
				cmake_build_directory = "${variant:buildType}",               -- this is used to specify generate directory for cmake
				cmake_build_directory_prefix = "",                            -- when cmake_build_directory is set to "", this option will be activated
				cmake_soft_link_compile_commands = true,                      -- this will automatically make a soft link from compile commands file to project root dir
				cmake_compile_commands_from_lsp = false,                      -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
				cmake_kits_path = nil,                                        -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
				cmake_variants_message = {
					short = { show = true },                                    -- whether to show short message
					long = { show = true, max_length = 40 },                    -- whether to show long message
				},
				cmake_dap_configuration = {                                   -- debug settings for cmake
					name = "cpp",
					type = "codelldb",
					request = "launch",
					stopOnEntry = false,
					runInTerminal = true,
					console = "integratedTerminal",
				},
				cmake_executor = {    -- executor to use
					name = "quickfix",  -- name of the executor
					opts = {},          -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
					default_opts = {    -- a list of default and possible values for executors
						quickfix = {
							show = "always", -- "always", "only_on_error"
							position = "botright", -- "bottom", "top"
							size = 10,
						},
						overseer = {
							new_task_opts = {},        -- options to pass into the `overseer.new_task` command
							on_new_task = function(task) end, -- a function that gets overseer.Task when it is created, before calling `task:start`
						},
						terminal = {},               -- terminal executor uses the values in cmake_terminal
					},
				},
				cmake_terminal = {
					name = "terminal",
					opts = {
						name = "Main Terminal",
						prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
						split_direction = "horizontal", -- "horizontal", "vertical"
						split_size = 11,

						-- Window handling
						single_terminal_per_instance = true, -- Single viewport, multiple windows
						single_terminal_per_tab = true, -- Single viewport per tab
						keep_terminal_static_location = true, -- Static location of the viewport if avialable

						-- Running Tasks
						start_insert_in_launch_task = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
						start_insert_in_other_tasks = false, -- If you want to enter terminal with :startinsert upon launching all other cmake tasks in the terminal. Generally set as false
						focus_on_main_terminal = false, -- Focus on cmake terminal when cmake task is launched. Only used if executor is terminal.
						focus_on_launch_terminal = false, -- Focus on cmake launch terminal when executable target in launched.
					},
				},
				cmake_notifications = {
					enabled = true, -- show cmake execution progress in nvim-notify
					spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
					refresh_rate_ms = 100, -- how often to iterate icons
				},
			})
		end,
	},
}
