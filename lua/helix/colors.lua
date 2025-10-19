local M = {}

---@class HelixPalette
---@field background string
---@field charcoal string
---@field foreground string
---@field black string
---@field ["black-light"] string
---@field white string
---@field red string
---@field green string
---@field yellow string
---@field blue string
---@field magenta string
---@field cyan string
---@field orange string
---@field peach string
---@field mint string
---@field pink string
---@field lavender string
---@field teal string
---@field comment string
---@field ["light-comment"] string
---@field ["dark-comment"] string
---@field grey string
---@field ["light-charcoal"] string
---@field cursorline string
---@field none string
---@field ["diff-add-bg"] string
---@field ["diff-del-bg"] string
---@field ["diff-change-bg"] string
---@field ["diff-text-bg"] string
---@field ["h1-bg"] string
---@field ["h2-bg"] string
---@field ["h3-bg"] string
---@field ["h4-bg"] string
---@field ["h5-bg"] string
---@field ["h6-bg"] string

---@class HelixColors
---@field bg0 string
---@field bg1 string
---@field bg2 string
---@field bg3 string
---@field bg_d string
---@field fg string
---@field black string
---@field red string
---@field green string
---@field yellow string
---@field blue string
---@field purple string
---@field cyan string
---@field white string
---@field orange string
---@field comment string
---@field light_grey string
---@field grey string
---@field dark_grey string
---@field bg_blue string
---@field bg_yellow string
---@field cursorline string
---@field diff_add string
---@field diff_delete string
---@field diff_change string
---@field diff_text string
---@field peach string
---@field mint string
---@field pink string
---@field lavender string
---@field teal string
---@field none string
---@field h1_fg string
---@field h1_bg string
---@field h2_fg string
---@field h2_bg string
---@field h3_fg string
---@field h3_bg string
---@field h4_fg string
---@field h4_bg string
---@field h5_fg string
---@field h5_bg string
---@field h6_fg string
---@field h6_bg string

---@type HelixPalette
M.palette = {
  -- Main colors
  background = '#141b1e',
  charcoal = '#1f1f1f',
  foreground = '#dadada',
  -- Base colors
  black = '#232a2d',
  ['black-light'] = '#2d3437',
  white = '#b3b9b8',
  -- Primary colors
  red = '#e57474',
  green = '#8ccf7e',
  yellow = '#e5c76b',
  blue = '#67b0e8',
  magenta = '#c47fd5',
  cyan = '#6cbfbf',
  -- Special colors
  orange = '#ffc285',
  peach = '#f2b5a7',
  mint = '#5de6a8',
  pink = '#f38ba8',
  lavender = '#c8a8e8',
  teal = '#4FB6B8',
  -- UI colors
  comment = '#7a7c7e',
  ['light-comment'] = '#8a8c8e',
  ['dark-comment'] = '#404749',
  grey = '#505557',
  ['light-charcoal'] = '#2f2f2f',
  cursorline = '#2c3333',
  none = 'NONE',
  -- Diff backgrounds (muted, not full saturation)
  ['diff-add-bg'] = '#1e2d1e',
  ['diff-del-bg'] = '#2d1e1e',
  ['diff-change-bg'] = '#1e2233',
  ['diff-text-bg'] = '#2d475d',
  -- Heading backgrounds
  ['h1-bg'] = '#2d2035',
  ['h2-bg'] = '#1e2d26',
  ['h3-bg'] = '#1e2a35',
  ['h4-bg'] = '#2d2626',
  ['h5-bg'] = '#2a2d1e',
  ['h6-bg'] = '#1e2d2d',
}

---@return HelixColors
function M.setup()
  local palette = M.palette
  return {
    -- Background & Foreground
    bg0 = palette.charcoal,
    bg1 = palette['light-charcoal'],
    bg2 = palette.black,
    bg3 = palette['black-light'],
    bg_d = palette.background,
    fg = palette.foreground,
    -- Core colors
    black = palette.black,
    red = palette.red,
    green = palette.green,
    yellow = palette.yellow,
    blue = palette.blue,
    purple = palette.magenta,
    cyan = palette.cyan,
    white = palette.white,
    orange = palette.orange,
    -- Light variants
    comment = palette.comment,
    light_grey = palette['light-comment'],
    grey = palette.comment,
    dark_grey = palette['dark-comment'],
    -- UI specific
    bg_blue = palette.blue,
    bg_yellow = palette.yellow,
    cursorline = palette.cursorline,
    -- Diff colors (muted backgrounds)
    diff_add = palette['diff-add-bg'],
    diff_delete = palette['diff-del-bg'],
    diff_change = palette['diff-change-bg'],
    diff_text = palette['diff-text-bg'],
    -- Special colors
    peach = palette.peach,
    mint = palette.mint,
    pink = palette.pink,
    lavender = palette.lavender,
    teal = palette.teal,
    none = palette.none,
    -- Heading colors
    h1_fg = palette.magenta,
    h1_bg = palette['h1-bg'],
    h2_fg = palette.green,
    h2_bg = palette['h2-bg'],
    h3_fg = palette.blue,
    h3_bg = palette['h3-bg'],
    h4_fg = palette.red,
    h4_bg = palette['h4-bg'],
    h5_fg = palette.yellow,
    h5_bg = palette['h5-bg'],
    h6_fg = palette.cyan,
    h6_bg = palette['h6-bg'],
  }
end

return M
