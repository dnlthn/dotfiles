return {
  config = function()
    local overrides = {}
    local defaults = {
      show_numbers = true, -- Enable 'number' for the window while peeking
      show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
      centered_peeking = true, -- Peeked line will be centered relative to window
    }

    require("numb").setup(vim.tbl_deep_extend("force", defaults, overrides))
  end,
}
