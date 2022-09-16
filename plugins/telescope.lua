local actions = require "telescope.actions"

return {
  defaults = {
    selection_caret = " ",
    results_title = false,

    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
  },
}
