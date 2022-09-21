return {
  n = {
    ["gr"] = {
      function()
        require("telescope.builtin").lsp_references(require("telescope.themes").get_dropdown {
          initial_mode = "normal",
          preview_title = false,
          layout_config = {
            width = 0.87,
          },
        })
      end,
      desc = "Search references",
    },
  },
}
