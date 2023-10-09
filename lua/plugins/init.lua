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
  "folke/neodev.nvim",

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
    "akinsho/toggleterm.nvim",
    lazy = true,
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
        Normal = {
          guibg = "#1e222a",
        },
        NormalFloat = {
          -- link = "NormalNC",
          guibg = "#1e222a",
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
}
