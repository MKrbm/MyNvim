local M = {}


M = {
      {
        "<space><space>",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Find Plugin File",
      },
      {
        "<S-u>",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Find Plugin File",
        nowait = true,
      },
      {
        "mm",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Find Plugin File",
        nowait = true,
      },
      {
        "<S-k>",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Find Plugin File",
        nowait = true,
      },
      {
        "<S-j>",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Find Plugin File",
        nowait = true,
      },
      {
        "<leader>1",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        desc = "Find Plugin File",
        nowait = true,
      },
      {
        "<leader>2",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        desc = "Find Plugin File",
        nowait = true,
      },
      {
        "<leader>3",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        desc = "Find Plugin File",
        nowait = true,
      },
      {
        "<leader>4",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        desc = "Find Plugin File",
        nowait = true,
      },
    }


return M
