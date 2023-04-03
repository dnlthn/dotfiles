return {
  n = {
    ["<leader>bb"] = { "<cmd> tabnew <cr>", desc = "New tab" },
    ["<leader>`"] = { "<cmd> :e# <cr>", desc = "↩ Switch to last buffer" },
    ["<leader>."] = { function() require("telescope.builtin").find_files() end, desc = "Search files" },
    ["<leader>o"] = false,
  },
  o = {
    ["w"] = "iw",
    ["W"] = "iW",
    ["b"] = "ib",
    ["q"] = "iq",
    ["f"] = "if",
  },
  v = {},
  t = {
    ["<esc>"] = false,
    ["jk"] = false,
  },
}
