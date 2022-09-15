local _, cmp = pcall(require, "cmp")
local _, lspkind = pcall(require, "lspkind")
local compare = require "cmp.config.compare"

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
      }(entry, vim_item)
    end,
  },

  sorting = {
    comparators = {
      require "cmp_tabnine.compare",
      compare.locality,
      compare.recently_used,
      compare.score,
      compare.exact,
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
}
