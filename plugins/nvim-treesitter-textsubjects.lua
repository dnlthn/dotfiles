return {
  config = function()
    local overrides = {}

    local defaults = {
      textsubjects = {
        enable = true,
        prev_selection = ",", -- (Optional) keymap to select the previous selection
        keymaps = {
          ["."] = "textsubjects-smart",
          [";"] = "textsubjects-container-outer",
          ["i;"] = "textsubjects-container-inner",
        },
      },
    }
    require("nvim-treesitter.configs").setup(vim.tbl_deep_extend("force", defaults, overrides))
  end,
}
