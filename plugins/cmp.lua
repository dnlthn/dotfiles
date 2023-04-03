local _, cmp = pcall(require, "cmp")
local _, lspkind = pcall(require, "lspkind")
local cmp_window = require "cmp.utils.window"
local compare = require "cmp.config.compare"
local _, luasnip = pcall(require, "luasnip")

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
      and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

cmp.event:on("menu_opened", function() vim.b.copilot_suggestion_hidden = true end)

cmp.event:on("menu_closed", function() vim.b.copilot_suggestion_hidden = false end)

-- Hide scrollbar
cmp_window.info_ = cmp_window.info
cmp_window.info = function(self)
  local info = self:info_()
  info.scrollable = false
  return info
end

return {
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(entry, vim_item)
      if entry.source.name == "cmp_tabnine" then
        vim_item.kind = " Tabnine"
        return vim_item
      elseif entry.source.name == "buffer" then
        vim_item.kind = "﬘ Buffer"
        return vim_item
      end

      return lspkind.cmp_format {
            -- menu = {
            --   cmp_tabnine = "(TabNine)",
            --   buffer = "(buffer)",
            --   nvim_lsp = "(lsp)",
            --   luasnip = "(luasnip)",
            --   nvim_lua = "(lua)",
            --   latex_symbols = "(latex)",
            -- },
          } (entry, vim_item)
    end,
  },
  sorting = {
    comparators = {
      compare.exact,
      require "cmp_tabnine.compare",
      compare.recently_used,
      compare.locality,
      compare.score,
      compare.offset,
      -- compare.scopes,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },
  window = {
    completion = cmp.config.window.bordered {
      border = "single",
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
    },
    documentation = cmp.config.window.bordered {
      border = "single",
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
    },
  },
  mapping = {
    ["<C-n>"] = cmp.mapping {
      i = cmp.mapping.abort(),
    },
    ["<C-p>"] = cmp.mapping {
      i = cmp.mapping.abort(),
    },
    ["<C-j>"] = cmp.mapping {
      i = cmp.mapping.abort(),
    },
    ["<C-k>"] = cmp.mapping {
      i = cmp.mapping.abort(),
    },

    ["<Tab>"] = cmp.mapping(function(fallback)
      -- local copilot_keys = vim.fn["copilot#Accept"]()

      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand {}
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept()
        -- elseif copilot_keys ~= "" then
        --   vim.api.nvim_feedkeys(copilot_keys, "i", true)
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
}
