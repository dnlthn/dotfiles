return function()
  local colors = require "user.colors.oxocarbon"
  -- Attempt to make lazygit more readable from term
  -- Honestly might just be better off doing a tmux float
  local g = vim.g
  g.terminal_color_0 = colors.cursor
  g.terminal_color_1 = colors.pink
  g.terminal_color_2 = colors.green
  g.terminal_color_3 = colors.lighter_comment
  g.terminal_color_4 = colors.onyx
  g.terminal_color_5 = colors.hint
  g.terminal_color_6 = colors.turquoise
  g.terminal_color_7 = colors.hint
  g.terminal_color_8 = colors.cursor
  g.terminal_color_9 = colors.turquoise
  g.terminal_color_10 = colors.turquoise
  g.terminal_color_11 = colors.purple
end
