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
    ["<C-n>"] = {
      function()
        vim.cmd('FocusSplitNicely')
        require("telescope.builtin").find_files({})
      end, desc = "Open file in new split"
    },
    ["<leader><leader>"] = {
      "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown {previewer=false,initial_mode='normal'})<cr>", desc =
    "  buffers" },
  },
}
