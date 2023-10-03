local M = {}


M = {
      {
        "<leader>a",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Find Plugin File",
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
        "<S-j>",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Find Plugin File",
        nowait = true,
      },
      {
        "<S-k>",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Find Plugin File",
        nowait = true,
      },
      {
        "<M-1>",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        desc = "Find Plugin File",
        nowait = true,
      },
      {
        "<M-2>",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        desc = "Find Plugin File",
        nowait = true,
      },
      {
        "<M-3>",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        desc = "Find Plugin File",
        nowait = true,
      },
      {
        "<M-4>",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        desc = "Find Plugin File",
        nowait = true,
      },
    }


return M
