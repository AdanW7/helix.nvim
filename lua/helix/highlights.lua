local color = require('helix.colors').setup()
local cfg = vim.g.helix_config

local M = {}
local hl = { langs = {}, plugins = {} }

local function vim_highlights(highlights)
  for group_name, group_settings in pairs(highlights) do
    vim.api.nvim_command(
      string.format(
        'highlight %s guifg=%s guibg=%s guisp=%s gui=%s',
        group_name,
        group_settings.fg or 'none',
        group_settings.bg or 'none',
        group_settings.sp or 'none',
        group_settings.fmt or 'none'
      )
    )
  end
end

local colors = {
  Fg = { fg = color.fg },
  LightGrey = { fg = color.light_grey },
  Grey = { fg = color.grey },
  Red = { fg = color.red },
  Cyan = { fg = color.cyan },
  Yellow = { fg = color.yellow },
  Orange = { fg = color.orange },
  Green = { fg = color.green },
  Blue = { fg = color.blue },
  Purple = { fg = color.purple },
  Peach = { fg = color.peach },
  Mint = { fg = color.mint },
}

hl.common = {
  Normal = { fg = color.fg, bg = cfg.transparent and color.none or color.bg0 },
  Terminal = { fg = color.fg, bg = cfg.transparent and color.none or color.bg0 },
  EndOfBuffer = {
    fg = cfg.ending_tildes and color.bg2 or color.bg0,
    bg = cfg.transparent and color.none or color.bg0,
  },
  FoldColumn = { fg = color.fg, bg = cfg.transparent and color.none or color.bg1 },
  Folded = { fg = color.fg, bg = cfg.transparent and color.none or color.bg1 },
  SignColumn = { fg = color.fg, bg = cfg.transparent and color.none or color.bg0 },
  ToolbarLine = { fg = color.fg },

  Cursor = { fmt = 'reverse' },
  vCursor = { fmt = 'reverse' },
  iCursor = { fmt = 'reverse' },
  lCursor = { fmt = 'reverse' },
  CursorIM = { fmt = 'reverse' },
  CursorColumn = { bg = color.bg1 },
  CursorLine = { bg = color.cursorline },
  ColorColumn = { bg = color.bg1 },
  CursorLineNr = { fg = color.cyan },
  LineNr = { fg = color.yellow },

  Conceal = { fg = color.grey, bg = color.bg1 },

  -- Diff
  Added = colors.Green,
  Removed = colors.Red,
  Changed = colors.Blue,
  DiffAdd = { fg = color.none, bg = color.diff_add },
  DiffChange = { fg = color.none, bg = color.diff_change },
  DiffDelete = { fg = color.none, bg = color.diff_delete },
  DiffText = { fg = color.none, bg = color.diff_text },

  Directory = { fg = color.blue },
  ErrorMsg = { fg = color.red, fmt = 'bold' },
  WarningMsg = { fg = color.yellow, fmt = 'bold' },
  MoreMsg = { fg = color.blue, fmt = 'bold' },

  -- Search
  CurSearch = { fg = color.bg0, bg = color.orange },
  IncSearch = { fg = color.bg0, bg = color.orange },
  Search = { fg = color.bg0, bg = color.bg_yellow },
  Substitute = { fg = color.bg0, bg = color.green },

  MatchParen = { bg = color.mint, fg = color.dark_grey, fmt = 'bold,underline,' },
  NonText = { fg = color.grey },
  Whitespace = { fg = color.dark_grey },
  SpecialKey = { fg = color.grey },

  -- Popup menu
  Pmenu = { fg = color.mint, bg = color.bg1 },
  PmenuSbar = { fg = color.none, bg = color.bg1 },
  PmenuSel = { fg = color.blue, bg = color.dark_grey },
  WildMenu = { fg = color.bg0, bg = color.blue },
  PmenuThumb = { fg = color.none, bg = color.grey },

  Question = { fg = color.yellow },

  -- Spell
  SpellBad = { fg = color.none, fmt = 'undercurl', sp = color.red },
  SpellCap = { fg = color.none, fmt = 'undercurl', sp = color.yellow },
  SpellLocal = { fg = color.none, fmt = 'undercurl', sp = color.blue },
  SpellRare = { fg = color.none, fmt = 'undercurl', sp = color.purple },

  -- Status line
  StatusLine = { fg = color.white, bg = color.bg0 },
  StatusLineTerm = { fg = color.white, bg = color.bg0 },
  StatusLineNC = { fg = color.black, bg = color.dark_grey },
  StatusLineTermNC = { fg = color.black, bg = color.dark_grey },

  -- Tab line
  TabLine = { fg = color.mint, bg = color.bg1 },
  TabLineFill = { fg = color.grey, bg = color.bg1 },
  TabLineSel = { fg = color.bg0, bg = color.fg },

  WinSeparator = { fg = color.comment },
  Visual = { bg = color.grey },
  VisualNOS = { fg = color.none, bg = color.bg2, fmt = 'underline' },

  QuickFixLine = { fg = color.blue, fmt = 'underline' },
  Debug = { fg = color.yellow },
  debugPC = { fg = color.bg0, bg = color.green },
  debugBreakpoint = { fg = color.bg0, bg = color.red },

  ToolbarButton = { fg = color.bg0, bg = color.bg_blue },
  FloatBorder = { fg = color.grey, bg = color.bg1 },
  NormalFloat = { fg = color.mint, bg = color.bg1 },
}

hl.syntax = {
  String = { fg = color.green, fmt = cfg.code_style.strings },
  Character = colors.Orange,
  Number = colors.Yellow,
  Float = colors.Orange,
  Boolean = colors.Cyan,

  Type = colors.Yellow,
  Structure = colors.Yellow,
  StorageClass = colors.Yellow,
  Identifier = { fg = color.peach, fmt = cfg.code_style.variables },
  Constant = { fg = color.orange, fmt = cfg.code_style.constants },

  PreProc = colors.Purple,
  PreCondit = colors.Purple,
  Include = colors.Red,
  Keyword = { fg = color.blue, fmt = cfg.code_style.keywords },
  Define = colors.Purple,
  Typedef = colors.Yellow,

  Exception = colors.Purple,
  Conditional = { fg = color.red, fmt = cfg.code_style.keywords },
  Repeat = { fg = color.yellow, fmt = cfg.code_style.keywords },
  Statement = colors.Purple,
  Macro = colors.Green,
  Error = colors.Purple,
  Label = colors.Blue,

  Special = colors.Red,
  SpecialChar = colors.Red,
  Function = { fg = color.red, fmt = cfg.code_style.functions },
  Operator = colors.Blue,
  Title = colors.Cyan,
  Tag = colors.Blue,
  Delimiter = colors.Mint,

  Comment = { fg = color.light_grey, fmt = cfg.code_style.comments },
  SpecialComment = { fg = color.light_grey, fmt = cfg.code_style.comments },
  Todo = { fg = color.red, fmt = cfg.code_style.comments },
}

-- TreeSitter
if vim.api.nvim_call_function('has', { 'nvim-0.8' }) == 1 then
  hl.treesitter = {
    ['@variable'] = { fg = color.peach, fmt = cfg.code_style.variables },
    ['@variable.builtin'] = { fg = color.blue, fmt = cfg.code_style.variables },
    ['@variable.parameter'] = { fg = color.red },
    ['@variable.member'] = { fg = color.red },

    ['@constant'] = { fg = color.cyan, fmt = cfg.code_style.constants },
    ['@constant.builtin'] = { fg = color.blue },
    ['@constant.builtin.boolean'] = { fg = color.cyan, fmt = 'bold,italic' },
    ['@constant.macro'] = { fg = color.green, fmt = 'bold' },

    ['@string'] = { fg = color.green, fmt = cfg.code_style.strings },
    ['@string.escape'] = colors.Blue,
    ['@string.special'] = colors.Blue,
    ['@string.special.symbol'] = colors.Red,
    ['@string.special.url'] = colors.Blue,
    ['@string.regexp'] = colors.Peach,

    ['@character'] = colors.Blue,
    ['@number'] = colors.Yellow,
    ['@number.float'] = colors.Orange,
    ['@boolean'] = colors.Cyan,

    ['@function'] = { fg = color.red, fmt = cfg.code_style.functions },
    ['@function.builtin'] = { fg = color.cyan, fmt = cfg.code_style.functions },
    ['@function.macro'] = colors.Green,
    ['@function.method'] = { fg = color.blue },
    ['@constructor'] = { fg = color.blue },

    ['@keyword'] = { fg = color.blue, fmt = cfg.code_style.keywords },
    ['@keyword.coroutine'] = colors.Peach,
    ['@keyword.function'] = colors.Mint,
    ['@keyword.operator'] = colors.Blue,
    ['@keyword.type'] = colors.Mint,
    ['@keyword.modifier'] = colors.Cyan,
    ['@keyword.control.import'] = colors.Blue,
    ['@keyword.control.conditional'] = colors.Red,
    ['@keyword.control.exception'] = colors.Purple,
    ['@keyword.control.repeat'] = { fg = color.yellow },
    ['@keyword.control.return'] = colors.Blue,
    ['@keyword.directive'] = colors.Peach,

    ['@operator'] = { fg = color.white },
    ['@punctuation.delimiter'] = colors.Mint,
    ['@punctuation.bracket'] = colors.Mint,
    ['@punctuation.special'] = colors.Mint,

    ['@comment'] = { fg = color.light_grey, fmt = cfg.code_style.comments },
    ['@comment.todo'] = { fg = color.cyan, fmt = cfg.code_style.comments },

    ['@tag'] = colors.Blue,
    ['@tag.attribute'] = colors.Blue,
    ['@tag.delimiter'] = colors.Blue,

    ['@type'] = colors.Yellow,
    ['@type.builtin'] = colors.Yellow,

    ['@attribute'] = colors.Blue,
    ['@property'] = colors.Cyan,
    ['@label'] = colors.Blue,
    ['@namespace'] = colors.Red,

    -- Markup
    ['@markup.strong'] = { fg = color.purple, fmt = 'bold' },
    ['@markup.italic'] = { fg = color.yellow, fmt = 'italic' },
    ['@markup.strikethrough'] = { fmt = 'strikethrough' },
    ['@markup.underline'] = { fmt = 'underline' },

    ['@markup.heading'] = { fg = color.blue, fmt = 'bold' }, -- fallback
    ['@markup.heading.1'] = { fg = color.h1_fg, fmt = 'bold' },
    ['@markup.heading.2'] = { fg = color.h2_fg, fmt = 'bold' },
    ['@markup.heading.3'] = { fg = color.h3_fg, fmt = 'bold' },
    ['@markup.heading.4'] = { fg = color.h4_fg, fmt = 'bold' },
    ['@markup.heading.5'] = { fg = color.h5_fg, fmt = 'bold' },
    ['@markup.heading.6'] = { fg = color.h6_fg, fmt = 'bold' },
    ['@markup.heading.1.markdown'] = { fg = color.h1_fg, fmt = 'bold' },
    ['@markup.heading.2.markdown'] = { fg = color.h2_fg, fmt = 'bold' },
    ['@markup.heading.3.markdown'] = { fg = color.h3_fg, fmt = 'bold' },
    ['@markup.heading.4.markdown'] = { fg = color.h4_fg, fmt = 'bold' },
    ['@markup.heading.5.markdown'] = { fg = color.h5_fg, fmt = 'bold' },
    ['@markup.heading.6.markdown'] = { fg = color.h6_fg, fmt = 'bold' },
    ['@markup.quote'] = { fg = color.yellow, fmt = 'italic' },
    ['@markup.math'] = colors.Fg,

    ['@markup.link'] = { fg = color.green },
    ['@markup.link.label'] = { fg = color.green },
    ['@markup.link.url'] = { fg = color.green },
    ['@markup.link.text'] = colors.Red,
    ['@markup.list'] = colors.Peach,
    ['@markup.list.checked'] = colors.Green,
    ['@markup.list.unchecked'] = colors.Red,
    ['@markup.raw'] = colors.Cyan,

    -- Diffs
    ['@diff.plus'] = colors.Green,
    ['@diff.minus'] = colors.Red,
    ['@diff.delta'] = colors.Purple,
  }
end

-- LSP
hl.plugins.lsp = {
  -- Diagnostics
  DiagnosticError = { fg = color.red },
  DiagnosticHint = { fg = color.green },
  DiagnosticInfo = { fg = color.blue },
  DiagnosticWarn = { fg = color.yellow },

  DiagnosticVirtualTextError = {
    fg = color.red,
    bg = cfg.diagnostics.background and color.bg1 or color.none,
  },
  DiagnosticVirtualTextWarn = {
    fg = color.yellow,
    bg = cfg.diagnostics.background and color.bg1 or color.none,
  },
  DiagnosticVirtualTextInfo = {
    fg = color.blue,
    bg = cfg.diagnostics.background and color.bg1 or color.none,
  },
  DiagnosticVirtualTextHint = {
    fg = color.green,
    bg = cfg.diagnostics.background and color.bg1 or color.none,
  },

  DiagnosticUnderlineError = {
    fmt = cfg.diagnostics.undercurl and 'undercurl' or 'underline',
    sp = color.red,
  },
  DiagnosticUnderlineHint = {
    fmt = cfg.diagnostics.undercurl and 'undercurl' or 'underline',
    sp = color.green,
  },
  DiagnosticUnderlineInfo = {
    fmt = cfg.diagnostics.undercurl and 'undercurl' or 'underline',
    sp = color.blue,
  },
  DiagnosticUnderlineWarn = {
    fmt = cfg.diagnostics.undercurl and 'undercurl' or 'underline',
    sp = color.yellow,
  },

  LspReferenceText = { bg = color.bg2 },
  LspReferenceWrite = { bg = color.bg2 },
  LspReferenceRead = { bg = color.bg2 },

  LspCodeLens = { fg = color.comment, fmt = cfg.code_style.comments },
  LspCodeLensSeparator = { fg = color.comment },
}

hl.lsp_semantic = {

  ['@lsp.mod.abstract'] = { fmt = 'italic' },
  ['@lsp.mod.async'] = { fmt = 'italic' },
  ['@lsp.mod.deprecated'] = { fmt = 'strikethrough' },
  ['@lsp.mod.readonly'] = { fmt = 'italic' },
  ['@lsp.mod.static'] = { fmt = 'bold' },

  ['@lsp.typemod.function.async'] = { fg = color.purple, fmt = 'italic' },
  ['@lsp.typemod.variable.readonly'] = { fg = color.orange },
  ['@lsp.typemod.function.defaultLibrary'] = { fg = color.cyan },
}

-- Popular plugins
hl.plugins.cmp = {
  CmpItemAbbr = colors.Fg,
  CmpItemAbbrDeprecated = { fg = color.light_grey, fmt = 'strikethrough' },
  CmpItemAbbrMatch = colors.Cyan,
  CmpItemAbbrMatchFuzzy = { fg = color.cyan, fmt = 'underline' },
  CmpItemMenu = colors.LightGrey,
  CmpItemKind = { fg = color.purple, fmt = cfg.cmp_itemkind_reverse and 'reverse' },
}

hl.plugins.gitsigns = {
  GitSignsAdd = colors.Green,
  GitSignsChange = colors.Blue,
  GitSignsDelete = colors.Red,
}

hl.plugins.telescope = {
  TelescopeBorder = colors.Red,
  TelescopePromptBorder = colors.Cyan,
  TelescopeResultsBorder = colors.Cyan,
  TelescopePreviewBorder = colors.Cyan,
  TelescopeMatching = { fg = color.orange, fmt = 'bold' },
  TelescopePromptPrefix = colors.Green,
  TelescopeSelection = { bg = color.bg2 },
  TelescopeSelectionCaret = colors.Yellow,
}

hl.plugins.nvim_tree = {
  NvimTreeNormal = { fg = color.fg, bg = cfg.transparent and color.none or color.bg_d },
  NvimTreeVertSplit = { fg = color.bg_d, bg = cfg.transparent and color.none or color.bg_d },
  NvimTreeRootFolder = { fg = color.orange, fmt = 'bold' },
  NvimTreeGitDirty = colors.Yellow,
  NvimTreeGitNew = colors.Green,
  NvimTreeGitDeleted = colors.Red,
  NvimTreeSpecialFile = { fg = color.yellow, fmt = 'underline' },
  NvimTreeIndentMarker = colors.Fg,
  NvimTreeImageFile = { fg = color.purple },
  NvimTreeSymlink = colors.Purple,
  NvimTreeFolderName = colors.Blue,
}

hl.plugins.render_markdown = {
  -- Heading foregrounds (icons)
  RenderMarkdownH1 = { fg = color.h1_fg },
  RenderMarkdownH2 = { fg = color.h2_fg },
  RenderMarkdownH3 = { fg = color.h3_fg },
  RenderMarkdownH4 = { fg = color.h4_fg },
  RenderMarkdownH5 = { fg = color.h5_fg },
  RenderMarkdownH6 = { fg = color.h6_fg },

  -- Heading backgrounds (subtle tinted)
  RenderMarkdownH1Bg = { fg = color.h1_fg, bg = color.h1_bg },
  RenderMarkdownH2Bg = { fg = color.h2_fg, bg = color.h2_bg },
  RenderMarkdownH3Bg = { fg = color.h3_fg, bg = color.h3_bg },
  RenderMarkdownH4Bg = { fg = color.h4_fg, bg = color.h4_bg },
  RenderMarkdownH5Bg = { fg = color.h5_fg, bg = color.h5_bg },
  RenderMarkdownH6Bg = { fg = color.h6_fg, bg = color.h6_bg },

  -- Code blocks
  RenderMarkdownCode = { bg = color.bg1 },
  RenderMarkdownCodeBorder = { bg = color.bg1 },
  RenderMarkdownCodeInline = { bg = color.bg2 },

  -- Other elements
  RenderMarkdownBullet = { fg = color.peach },
  RenderMarkdownDash = { fg = color.comment },
  RenderMarkdownQuote = { fg = color.yellow },
  RenderMarkdownChecked = { fg = color.green },
  RenderMarkdownUnchecked = { fg = color.red },
  RenderMarkdownTodo = { fg = color.cyan },
  RenderMarkdownLink = { fg = color.green },
  RenderMarkdownMath = { fg = color.fg },
  RenderMarkdownSign = { bg = color.none },

  -- Callouts
  RenderMarkdownSuccess = { fg = color.green },
  RenderMarkdownInfo = { fg = color.blue },
  RenderMarkdownHint = { fg = color.cyan },
  RenderMarkdownWarn = { fg = color.yellow },
  RenderMarkdownError = { fg = color.red },
}

function M.setup()
  vim_highlights(hl.common)
  vim_highlights(hl.syntax)
  if hl.treesitter then
    vim_highlights(hl.treesitter)
  end
  for _, group in pairs(hl.plugins) do
    vim_highlights(group)
  end

  -- User defined highlights
  for group_name, group_settings in pairs(cfg.highlights) do
    local fg = group_settings.fg
        and (group_settings.fg:sub(1, 1) == '$' and color[group_settings.fg:sub(2)] or group_settings.fg)
      or 'none'
    local bg = group_settings.bg
        and (group_settings.bg:sub(1, 1) == '$' and color[group_settings.bg:sub(2)] or group_settings.bg)
      or 'none'
    local sp = group_settings.sp
        and (group_settings.sp:sub(1, 1) == '$' and color[group_settings.sp:sub(2)] or group_settings.sp)
      or 'none'

    vim.api.nvim_command(
      string.format(
        'highlight %s guifg=%s guibg=%s guisp=%s gui=%s',
        group_name,
        fg,
        bg,
        sp,
        group_settings.fmt or 'none'
      )
    )
  end
end

return M
