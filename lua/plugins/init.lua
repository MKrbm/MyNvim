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

  -- cmdline tools and lsp servers
  {

    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
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
  -- {
  --   'akinsho/bufferline.nvim',
  --   lazy = false,
  --   version = "4.0.0",
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   config = function(_, opts)
  --     vim.opt.termguicolors = true
  --     local bufferline = require('bufferline')
  --     bufferline.setup({
  --       options = {
  --         style_preset = bufferline.style_preset.no_italic,
  --         -- or you can combine these e.g.
  --         style_preset = {
  --           bufferline.style_preset.no_italic,
  --           bufferline.style_preset.no_bold
  --         },
  --       }
  --     })
  --   end
  -- },

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
}
