return {
  n = {
    ["<TAB>"] = { "<cmd> :e# <cr>", desc = "↩ Switch to last buffer" },
    ["<ESC>"] = { "<cmd>noh<cr><esc>", desc = "Escape and clear hlsearch" },
    -- map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
    -- map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
    -- map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
    -- map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
    -- map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
    -- map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
    -- ["<A-j>"] = {}
  },
  o = {
    ["w"] = "iw",
    ["W"] = "iW",
    -- ["b"] = "ib",
    -- ["q"] = "iq",
    -- ["f"] = "if",
  },
  v = {},
}
-- map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
---- Move Lines
-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
-- map(
--   "n",
--   "<leader>ur",
--   "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
--   { desc = "Redraw / clear hlsearch / diff update" }
-- )
--map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })
---- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
-- map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
-- map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
-- Add undo break-points
-- map("i", ",", ",<c-g>u")
-- map("i", ".", ".<c-g>u")
-- map("i", ";", ";<c-g>u")
---- better indenting
-- map("v", "<", "<gv")
-- map("v", ">", ">gv")
---- highlights under cursor
-- if vim.fn.has("nvim-0.9.0") == 1 then
--   map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
-- end
-- { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
-- { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
-- { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
-- { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
-- { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
-- map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
--{ "<leader>*", Util.telescope("grep_string"), desc = "Word (root dir)" },
