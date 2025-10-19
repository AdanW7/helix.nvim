---@type HelixColors
local color = require('helix.colors').setup()
---@type HelixConfig
local cfg = vim.g.helix_config

local M = {}

---@class HelixHighlightGroups
---@field common HelixHighlightMap
---@field syntax HelixHighlightMap
---@field treesitter? HelixHighlightMap
---@field lsp_semantic HelixHighlightMap
---@field plugins table<string, HelixHighlightMap>

---@type HelixHighlightGroups
local hl = { common = {}, syntax = {}, lsp_semantic = {}, plugins = {} }

---@param highlights HelixHighlightMap
---@return nil
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

---@type table<string, HelixHighlight>
local colors = {
  Fg = { fg = color.fg },
  LightGrey = { fg = color.light_grey },
  Grey = { fg = color.grey },
  Red = { fg = color.red },
  Cyan = { fg = color.cyan },
  Yellow = { fg = color.yellow },
  Teal = { fg = color.teal },
  Orange = { fg = color.orange },
  Green = { fg = color.green },
  Blue = { fg = color.blue },
  Pink = { fg = color.pink },
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

  YankHighlight = { bg = color.cyan, fg = color.bg0 },
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
  CurSearch = { fg = color.bg0, bg = color.red },
  IncSearch = { fg = color.bg0, bg = color.red },
  Search = { fg = color.bg0, bg = color.red },
  Substitute = { fg = color.bg0, bg = color.green },

  MatchParen = { bg = color.lavender, fg = color.dark_grey, fmt = 'bold,underline,' },
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
  Number = colors.Orange,
  Float = colors.Orange,
  Boolean = colors.Cyan,

  Type = colors.Teal,
  Structure = colors.Teal,
  StorageClass = colors.Teal,
  Typedef = colors.Teal,
  Identifier = { fg = color.peach, fmt = cfg.code_style.variables },
  Constant = { fg = color.peach, fmt = cfg.code_style.constants },

  PreProc = colors.Purple,
  PreCondit = colors.Purple,
  Include = colors.Blue,
  Keyword = { fg = color.blue, fmt = cfg.code_style.keywords },
  Define = colors.Purple,

  Exception = colors.Purple,
  Conditional = { fg = color.red, fmt = cfg.code_style.keywords },
  Repeat = { fg = color.purple, fmt = cfg.code_style.keywords },
  Statement = colors.Purple,
  Macro = colors.Green,
  Error = colors.Purple,
  Label = colors.Blue,

  Special = colors.Blue,
  SpecialChar = colors.Blue,
  Function = { fg = color.red, fmt = cfg.code_style.functions },
  Operator = colors.Pink,
  Title = colors.Cyan,
  Tag = colors.Blue,
  Delimiter = colors.Mint,

  Comment = { fg = color.light_grey, fmt = cfg.code_style.comments },
  SpecialComment = { fg = color.light_grey, fmt = cfg.code_style.comments },
  Todo = { fg = color.red, fmt = 'bold,italic' },
}

-- TreeSitter
-- nvim started to use @variable syntax in 0.8
if vim.fn.has('nvim-0.8') == 1 then
  hl.treesitter = {
    ['@variable'] = { fg = color.peach, fmt = cfg.code_style.variables },
    ['@variable.builtin'] = { fg = color.blue, fmt = cfg.code_style.variables },
    ['@variable.parameter'] = { fg = color.purple },
    ['@variable.member'] = { fg = color.peach },

    ['@constant'] = { fg = color.peach, fmt = cfg.code_style.constants },
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
    ['@number'] = colors.Orange,
    ['@number.float'] = colors.Orange,
    ['@boolean'] = colors.Cyan,

    ['@function'] = { fg = color.red, fmt = cfg.code_style.functions },
    ['@function.builtin'] = { fg = color.cyan, fmt = cfg.code_style.functions },
    ['@function.macro'] = colors.Green,
    ['@function.method'] = colors.Blue,
    ['@constructor'] = colors.Blue,

    ['@keyword'] = { fg = color.blue, fmt = cfg.code_style.keywords },
    ['@keyword.coroutine'] = colors.Peach,
    ['@keyword.function'] = colors.Mint,
    ['@keyword.operator'] = colors.Pink,
    ['@keyword.type'] = colors.Mint,
    ['@keyword.modifier'] = colors.Mint,
    ['@keyword.control.import'] = colors.Blue,
    ['@keyword.control.conditional'] = colors.Red,
    ['@keyword.control.exception'] = colors.Purple,
    ['@keyword.control.repeat'] = colors.Purple,
    ['@keyword.control.return'] = colors.Blue,
    ['@keyword.directive'] = { fg = color.purple, fmt = 'bold' },

    ['@operator'] = { fg = color.pink },
    ['@punctuation.delimiter'] = colors.Mint,
    ['@punctuation.bracket'] = colors.Mint,
    ['@punctuation.special'] = colors.Mint,

    ['@comment'] = { fg = color.light_grey, fmt = cfg.code_style.comments },
    ['@comment.todo'] = { fg = color.cyan, fmt = cfg.code_style.comments },

    ['@tag'] = colors.Blue,
    ['@tag.attribute'] = colors.Blue,
    ['@tag.delimiter'] = colors.Blue,

    ['@type'] = colors.Teal,
    ['@type.builtin'] = colors.Teal,

    ['@attribute'] = colors.Blue,
    ['@property'] = colors.Peach,
    ['@label'] = colors.Blue,
    ['@namespace'] = colors.Teal,

    -- Markup
    ['@markup.strong'] = { fg = color.purple, fmt = 'bold' },
    ['@markup.italic'] = { fg = color.pink, fmt = 'italic' },
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
  ['@lsp.mod.readonly'] = { fmt = 'undercurl' },
  ['@lsp.mod.static'] = { fmt = 'bold' },

  ['@lsp.typemod.function.async'] = { fg = color.purple, fmt = 'italic' },
  ['@lsp.typemod.variable.readonly'] = { fg = color.yellow },
  ['@lsp.typemod.function.defaultLibrary'] = { fg = color.cyan },

  ['@lsp.type.member'] = colors.Peach,
  ['@lsp.type.property'] = colors.Peach,
  ['@lsp.type.enum'] = colors.Teal,
  ['@lsp.type.enumMember'] = colors.Peach,
  ['@lsp.type.type'] = colors.Teal,
  ['@lsp.type.struct'] = colors.Teal,
}

-- Popular plugins
hl.plugins.blink = {
  BlinkCmpMenu = { fg = color.mint, bg = color.bg1 },
  BlinkCmpMenuBorder = { fg = color.grey, bg = color.bg1 },
  BlinkCmpMenuSelection = { fg = color.blue, bg = color.dark_grey },
  BlinkCmpScrollBarThumb = { bg = color.grey },
  BlinkCmpScrollBarGutter = { bg = color.bg1 },
  BlinkCmpLabel = colors.Fg,
  BlinkCmpLabelDeprecated = { fg = color.light_grey, fmt = 'strikethrough' },
  BlinkCmpLabelMatch = colors.Cyan,
  BlinkCmpKind = { fg = color.purple },
  BlinkCmpSource = colors.LightGrey,
  BlinkCmpGhostText = { fg = color.grey },
  BlinkCmpDoc = { fg = color.mint, bg = color.bg1 },
  BlinkCmpDocBorder = { fg = color.grey, bg = color.bg1 },
  BlinkCmpDocSeparator = { fg = color.grey, bg = color.bg1 },
  BlinkCmpDocCursorLine = { bg = color.bg2 },
  BlinkCmpSignatureHelp = { fg = color.mint, bg = color.bg1 },
  BlinkCmpSignatureHelpBorder = { fg = color.grey, bg = color.bg1 },
  BlinkCmpSignatureHelpActiveParameter = { fg = color.orange, fmt = 'bold' },
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
hl.plugins.snacks = {
  SnacksPickerBorder = { fg = color.grey, bg = color.bg1 },
  SnacksPickerTitle = { fg = color.cyan, fmt = 'bold' },
  SnacksPickerInput = { fg = color.fg, bg = color.bg1 },
  SnacksPickerMatch = { fg = color.orange, fmt = 'bold' },
  SnacksPickerSelected = { fg = color.green },

  SnacksPickerDir = { fg = color.comment },

  SnacksDashboardHeader = { fg = color.green },
  SnacksDashboardFooter = { fg = color.red },
  SnacksDashboardKey = { fg = color.peach },
  SnacksDashboardDesc = { fg = color.cyan },
  SnacksDashboardIcon = { fg = color.blue },

  SnacksIndent = { fg = '#5f79a6' },
  SnacksIndentScope = { fg = '#7394cf', fmt = 'bold' },
}
-- mini.statusline
hl.plugins.mini_statusline = {
  MiniStatuslineModeNormal = { fg = color.bg0, bg = color.cyan, fmt = 'bold' },
  MiniStatuslineModeInsert = { fg = color.bg0, bg = color.green, fmt = 'bold' },
  MiniStatuslineModeVisual = { fg = color.bg0, bg = color.purple, fmt = 'bold' },
  MiniStatuslineModeReplace = { fg = color.bg0, bg = color.red, fmt = 'bold' },
  MiniStatuslineModeCommand = { fg = color.bg0, bg = color.yellow, fmt = 'bold' },
  MiniStatuslineModeOther = { fg = color.bg0, bg = color.teal, fmt = 'bold' },

  MiniStatuslineDevinfo = { fg = color.comment, bg = color.bg2 },
  MiniStatuslineFilename = { fg = color.white, bg = color.bg1 },
  MiniStatuslineFileinfo = { fg = color.comment, bg = color.bg2 },
  MiniStatuslineInactive = { fg = color.dark_grey, bg = color.bg_d },
}
hl.plugins.tabline = {
  -- Buffers --------------------------------------------------------
  TablineCurrent = { fg = color.bg0, bg = color.green, fmt = 'bold' }, -- active buffer
  TablineVisible = { fg = color.white, bg = color.bg_d }, -- buffer visible in a non-focused window
  TablineHidden = { fg = color.comment, bg = color.bg_d }, -- buffer not visible in any window
  TablineModifiedCurrent = { fg = color.purple, bg = color.green, fmt = 'bold' }, -- active buffer, unsaved
  TablineModifiedVisible = { fg = color.yellow, bg = color.bg_d }, -- visible buffer, unsaved
  TablineModifiedHidden = { fg = color.yellow, bg = color.bg_d }, -- hidden buffer, unsaved

  -- Tab pills ------------------------------------------------------
  TablineTabActive = { fg = color.bg0, bg = color.cyan, fmt = 'bold' }, -- current tab
  TablineTabInactive = { fg = color.comment, bg = color.bg_d }, -- every other tab

  -- Shared ---------------------------------------------------------
  TablineFill = { fg = color.none, bg = color.bg_d }, -- empty space / separator background
  TablineTrunc = { fg = color.comment, bg = color.bg_d }, -- '…' overflow indicators (both sides)
}

---@return nil
function M.setup()
  vim_highlights(hl.common)
  vim_highlights(hl.syntax)
  if hl.treesitter then
    vim_highlights(hl.treesitter)
  end
  vim_highlights(hl.lsp_semantic)
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
