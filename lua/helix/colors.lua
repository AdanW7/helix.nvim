-- Color palette for Helix theme
local M = {}

M.palette = {
  -- Main colors
  background = '#141b1e',
  charcoal = '#1f1f1f',
  foreground = '#dadada',

  -- Base colors
  black = '#232a2d',
  ['black-light'] = '#2d3437',
  white = '#b3b9b8',
  ['white-light'] = '#bdc3c2',

  -- Primary colors
  red = '#e57474',
  ['red-light'] = '#ef7e7e',
  green = '#8ccf7e',
  ['green-light'] = '#96d988',
  yellow = '#e5c76b',
  ['yellow-light'] = '#f4d67a',
  blue = '#67b0e8',
  ['blue-light'] = '#71baf2',
  magenta = '#c47fd5',
  ['magenta-light'] = '#ce89df',
  cyan = '#6cbfbf',
  ['cyan-light'] = '#67cbe7',

  -- Special colors
  orange = '#ffb366',
  peach = '#f2b5a7',
  mint = '#5de6a8',
  lavendar = '#c8a8e8',
  coral = '#FF7F50',
  ['soft-teal'] = '#a8d4d4',

  -- UI colors
  comment = '#7a7c7e',
  ['light-comment'] = '#8a8c8e',
  ['dark-comment'] = '#404749',
  grey = '#505557',
  ['light-charcoal'] = '#2f2f2f',
  contrast = '#161d1f',
  cursorline = '#2c3333',

  -- Special
  none = 'NONE',

  -- Heading backgrounds (dark tinted variants)
  ['h1-bg'] = '#2d2035', -- dark magenta tint
  ['h2-bg'] = '#1e2d26', -- dark green tint
  ['h3-bg'] = '#1e2a35', -- dark blue tint
  ['h4-bg'] = '#2d2626', -- dark red tint
  ['h5-bg'] = '#2a2d1e', -- dark yellow tint
  ['h6-bg'] = '#1e2d2d', -- dark cyan tint
}

-- Set active colors based on palette
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
    light_grey = palette['light-comment'],
    grey = palette.comment,
    dark_grey = palette['dark-comment'],

    -- UI specific
    bg_blue = palette.blue,
    bg_yellow = palette.yellow,
    cursorline = palette.cursorline,

    -- Diff colors
    diff_add = palette.green,
    diff_delete = palette.red,
    diff_change = palette.blue,
    diff_text = '#2d475d',

    -- Dark variants for diagnostics
    dark_red = palette.red,
    dark_yellow = palette.yellow,
    dark_cyan = palette.cyan,
    dark_purple = palette.magenta,

    -- Special colors
    peach = palette.peach,
    mint = palette.mint,
    lavendar = palette.lavendar,

    none = palette.none,

    -- Heading colors (foreground matches background tint)
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
