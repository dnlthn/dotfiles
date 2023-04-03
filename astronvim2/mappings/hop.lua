return {
  n = {
    ["f"] = { "<cmd>HopChar1<cr>", desc = "Hop to letter" },
    ["F"] = { "<cmd>HopChar1CurrentLine<cr>", desc = "Hop to letter on line" },

    ["t"] = {
      function()
        require("hop").hint_char1 {
          direction = require("hop.hint").HintDirection.AFTER_CURSOR,
          current_line_only = true,
          hint_offset = -1,
        }
      end,
      desc = "Hop before letter on line",
    },
    ["T"] = {
      function()
        require("hop").hint_char1 {
          hint_offset = -1,
        }
      end,
      desc = "Hop before letter",
    },
  },

  o = {
    ["t"] = {
      function()
        require("hop").hint_char1 {
          direction = require("hop.hint").HintDirection.AFTER_CURSOR,
          current_line_only = true,
          hint_offset = -1,
        }
      end,
      desc = "Hop before letter on line",
    },
    ["T"] = {
      function()
        require("hop").hint_char1 {
          hint_offset = -1,
        }
      end,
      desc = "Hop before letter",
    },
  },

  v = {
    ["f"] = { "<cmd>HopChar1<cr>", desc = "Hop to letter" },
    ["F"] = { "<cmd>HopChar1CurrentLine<cr>", desc = "Hop to letter on line" },

    ["t"] = {
      function()
        require("hop").hint_char1 {
          direction = require("hop.hint").HintDirection.AFTER_CURSOR,
          current_line_only = true,
          hint_offset = -1,
        }
      end,
      desc = "Hop before letter on line",
    },
    ["T"] = {
      function()
        require("hop").hint_char1 {
          hint_offset = -1,
        }
      end,
      desc = "Hop before letter",
    },
  },
}
