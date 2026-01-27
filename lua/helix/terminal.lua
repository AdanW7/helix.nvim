local M = {}

function M.setup()
  local cfg = vim.g.helix_config
  if not cfg.term_colors then
    return
  end

  local color = require('helix.colors').setup()

  vim.g.terminal_color_0 = color.black
  vim.g.terminal_color_1 = color.red
  vim.g.terminal_color_2 = color.green
  vim.g.terminal_color_3 = color.yellow
  vim.g.terminal_color_4 = color.blue
  vim.g.terminal_color_5 = color.purple
  vim.g.terminal_color_6 = color.cyan
  vim.g.terminal_color_7 = color.fg
  vim.g.terminal_color_8 = color.grey
  vim.g.terminal_color_9 = color.red
  vim.g.terminal_color_10 = color.green
  vim.g.terminal_color_11 = color.yellow
  vim.g.terminal_color_12 = color.blue
  vim.g.terminal_color_13 = color.purple
  vim.g.terminal_color_14 = color.cyan
  vim.g.terminal_color_15 = color.fg
end

return M
