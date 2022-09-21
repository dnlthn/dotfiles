return {
  n = {
    ["<TAB>"] = { "<cmd> BufferLineCycleNext <cr>", desc = "Go to next tab" },
    ["<S-TAB>"] = { "<cmd> BufferLineCyclePrev <cr>", desc = "Go to previous tab" },
    ["<leader>bc"] = { "<cmd> BufferLinePickClose <cr>", desc = "Close shown buffer" },
    ["<leader>bj"] = { "<cmd> BufferLinePick <cr>", desc = "Jump to shown buffer" },
    ["<leader>bs"] = { "<cmd> BufferLineSortByTabs <cr>", desc = "Sort by tabs" },
    ["<leader>bq"] = { "<cmd> BufferLineKill <cr>", desc = "Quit buffer" },
  },
}
