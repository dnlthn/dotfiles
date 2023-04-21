local function list_insert_unique(tbl, vals)
  if type(vals) ~= "table" then vals = { vals } end
  for _, val in ipairs(vals) do
    if not vim.tbl_contains(tbl, val) then table.insert(tbl, val) end
  end
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table or string "all".
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      elseif opts.ensure_installed == "all" then
        return
      end
      list_insert_unique(opts.ensure_installed, { "json", "jsonc" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table
      if not opts.ensure_installed then opts.ensure_installed = {} end
      list_insert_unique(opts.ensure_installed, "jsonls")
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table.
      if not opts.ensure_installed then opts.ensure_installed = {} end
      -- Add go lsps to opts.ensure_installed using vim.list_extend.
      list_insert_unique(opts.ensure_installed, "prettierd")
    end,
  },
}
