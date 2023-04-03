return {
  requires = "hrsh7th/nvim-cmp",
  run = "./install.sh",
  config = function()
    local tabnine = require "cmp_tabnine.config"

    local overrides = {
      max_num_results = 1,
    }

    local defaults = {
      max_lines = 1000,
      max_num_results = 20,
      sort = true,
      run_on_every_keystroke = true,
      snippet_placeholder = "..",
      ignored_file_types = {
        -- default is not to ignore
        -- uncomment to ignore in lua:
        -- lua = true
      },
      show_prediction_strength = false,
    }

    tabnine.setup(vim.tbl_deep_extend("force", defaults, overrides))
    astronvim.add_cmp_source { name = "cmp_tabnine", priority = 950, max_item_count = 1 }
  end,
}
