return {
  branch = "v2", -- optional but strongly recommended
  config = function()
    local overrides = {}
    local defaults = { keys = "etovxqpdygfblzhckisuran" }

    -- you can configure Hop the way you like here; see :h hop-config
    require("hop").setup(vim.tbl_deep_extend("force", defaults, overrides))
  end,
}
