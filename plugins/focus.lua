return {
  config = function()
    local overrides = {
      signcolumn = false,
    }

    local defaults = {
      -- Your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      enable = true,
      autoresize = true,
      width = 0,
      height = 0,
      minwidth = 0,
      minheight = 0,
      height_quickfix = 10,
      cursorline = true,
      cursorcolumn = false,
      signcolumn = true,
      colorcolumn = {
        enable = false,
        width = 80,
      },
      winhighlight = false,
      number = false,
      relativenumber = false,
      hybridnumber = false,
      absolutenumber_unfocussed = false,
      tmux = false,
      bufnew = false,
      compatible_filetrees = { "nvimtree", "nerdtree", "chadtree", "fern" },
      excluded_filetypes = {},
      excluded_windows = {},
      excluded_buftypes = { "nofile", "prompt", "popup" },
      forced_filetypes = { "dap-repl" },
    }

    require("focus").setup(vim.tbl_deep_extend("force", defaults, overrides))
  end,
}
