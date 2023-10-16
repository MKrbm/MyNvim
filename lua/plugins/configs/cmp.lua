local cmp = require "cmp"

vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#000001", fg = "#000001" })
vim.api.nvim_set_hl(0, "CmpFloatBorder", { bg = "red", fg = "blue" })
vim.api.nvim_set_hl(0, "CmpCursorLine", { bg = "pink", fg = "yellow" })

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

local options = {
  window = {
    completion = {
      scrollbar = false,
      winhighlight = "Normal:CmpNormal,FloatBorder:CmpFloatBorder,CursorLine:CursorLine,Search:None,SignColumn:Terminal"
    },
    documentation = {
      border = border "CmpDocBorder",
    },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  -- formatting = formatting_style,
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-e>"] = cmp.mapping.scroll_docs(-3),
    ["<C-y>"] = cmp.mapping.scroll_docs(3),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-d>"] = cmp.mapping.close(),
    -- ["<C-i>"] = cmp.complete(),
    ['<C-g>'] = function()
      if cmp.visible_docs() then
        cmp.close_docs()
        print("close docs")
      else
        cmp.open_docs()
        print("open docs")
      end
    end,
    ["<Enter>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

return options
