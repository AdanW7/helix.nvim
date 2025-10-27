local c = require('helix.colors').setup()
local cfg = vim.g.helix_config

local M = {}
local hl = { langs = {}, plugins = {} }

local function vim_highlights(highlights)
    for group_name, group_settings in pairs(highlights) do
        vim.api.nvim_command(string.format("highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
            group_name,
            group_settings.fg or "none",
            group_settings.bg or "none",
            group_settings.sp or "none",
            group_settings.fmt or "none"))
    end
end

local colors = {
    Fg = { fg = c.fg },
    LightGrey = { fg = c.light_grey },
    Grey = { fg = c.grey },
    Red = { fg = c.red },
    Cyan = { fg = c.cyan },
    Yellow = { fg = c.yellow },
    Orange = { fg = c.orange },
    Green = { fg = c.green },
    Blue = { fg = c.blue },
    Purple = { fg = c.purple },
    Peach = { fg = c.peach },
    Mint = { fg = c.mint },
}

hl.common = {
    Normal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
    Terminal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
    EndOfBuffer = { fg = cfg.ending_tildes and c.bg2 or c.bg0, bg = cfg.transparent and c.none or c.bg0 },
    FoldColumn = { fg = c.fg, bg = cfg.transparent and c.none or c.bg1 },
    Folded = { fg = c.fg, bg = cfg.transparent and c.none or c.bg1 },
    SignColumn = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
    ToolbarLine = { fg = c.fg },

    Cursor = { fmt = "reverse" },
    vCursor = { fmt = "reverse" },
    iCursor = { fmt = "reverse" },
    lCursor = { fmt = "reverse" },
    CursorIM = { fmt = "reverse" },
    CursorColumn = { bg = c.bg1 },
    CursorLine = { bg = c.cursorline },
    ColorColumn = { bg = c.bg1 },
    CursorLineNr = { fg = c.cyan },
    LineNr = { fg = c.yellow },

    Conceal = { fg = c.grey, bg = c.bg1 },

    -- Diff
    Added = colors.Green,
    Removed = colors.Red,
    Changed = colors.Blue,
    DiffAdd = { fg = c.none, bg = c.diff_add },
    DiffChange = { fg = c.none, bg = c.diff_change },
    DiffDelete = { fg = c.none, bg = c.diff_delete },
    DiffText = { fg = c.none, bg = c.diff_text },

    Directory = { fg = c.blue },
    ErrorMsg = { fg = c.red, fmt = "bold" },
    WarningMsg = { fg = c.yellow, fmt = "bold" },
    MoreMsg = { fg = c.blue, fmt = "bold" },

    -- Search
    CurSearch = { fg = c.bg0, bg = c.orange },
    IncSearch = { fg = c.bg0, bg = c.orange },
    Search = { fg = c.bg0, bg = c.bg_yellow },
    Substitute = { fg = c.bg0, bg = c.green },

    MatchParen = { bg = c.mint, fg = c.peach, fmt = "bold,underline," },
    NonText = { fg = c.grey },
    Whitespace = { fg = c.dark_grey },
    SpecialKey = { fg = c.grey },

    -- Popup menu
    Pmenu = { fg = c.mint, bg = c.bg1 },
    PmenuSbar = { fg = c.none, bg = c.bg1 },
    PmenuSel = { fg = c.blue, bg = c.dark_grey },
    WildMenu = { fg = c.bg0, bg = c.blue },
    PmenuThumb = { fg = c.none, bg = c.grey },

    Question = { fg = c.yellow },

    -- Spell
    SpellBad = { fg = c.none, fmt = "undercurl", sp = c.red },
    SpellCap = { fg = c.none, fmt = "undercurl", sp = c.yellow },
    SpellLocal = { fg = c.none, fmt = "undercurl", sp = c.blue },
    SpellRare = { fg = c.none, fmt = "undercurl", sp = c.purple },

    -- Status line
    StatusLine = { fg = c.white, bg = c.bg0 },
    StatusLineTerm = { fg = c.white, bg = c.bg0 },
    StatusLineNC = { fg = c.black, bg = c.dark_grey },
    StatusLineTermNC = { fg = c.black, bg = c.dark_grey },

    -- Tab line
    TabLine = { fg = c.mint, bg = c.bg1 },
    TabLineFill = { fg = c.grey, bg = c.bg1 },
    TabLineSel = { fg = c.bg0, bg = c.fg },

    WinSeparator = { fg = c.comment },
    Visual = { bg = c.grey },
    VisualNOS = { fg = c.none, bg = c.bg2, fmt = "underline" },

    QuickFixLine = { fg = c.blue, fmt = "underline" },
    Debug = { fg = c.yellow },
    debugPC = { fg = c.bg0, bg = c.green },
    debugBreakpoint = { fg = c.bg0, bg = c.red },

    ToolbarButton = { fg = c.bg0, bg = c.bg_blue },
    FloatBorder = { fg = c.grey, bg = c.bg1 },
    NormalFloat = { fg = c.mint, bg = c.bg1 },
}

hl.syntax = {
    String = { fg = c.green, fmt = cfg.code_style.strings },
    Character = colors.Orange,
    Number = colors.Yellow,
    Float = colors.Orange,
    Boolean = colors.Cyan,

    Type = colors.Yellow,
    Structure = colors.Yellow,
    StorageClass = colors.Yellow,
    Identifier = { fg = c.peach, fmt = cfg.code_style.variables },
    Constant = { fg = c.orange, fmt = cfg.code_style.constants },

    PreProc = colors.Purple,
    PreCondit = colors.Purple,
    Include = colors.Red,
    Keyword = { fg = c.blue, fmt = cfg.code_style.keywords },
    Define = colors.Purple,
    Typedef = colors.Yellow,

    Exception = colors.Purple,
    Conditional = { fg = c.red, fmt = cfg.code_style.keywords },
    Repeat = { fg = c.yellow, fmt = cfg.code_style.keywords },
    Statement = colors.Purple,
    Macro = colors.Green,
    Error = colors.Purple,
    Label = colors.Blue,

    Special = colors.Red,
    SpecialChar = colors.Red,
    Function = { fg = c.red, fmt = cfg.code_style.functions },
    Operator = colors.Blue,
    Title = colors.Cyan,
    Tag = colors.Blue,
    Delimiter = colors.Mint,

    Comment = { fg = c.light_grey, fmt = cfg.code_style.comments },
    SpecialComment = { fg = c.light_grey, fmt = cfg.code_style.comments },
    Todo = { fg = c.red, fmt = cfg.code_style.comments },
}

-- TreeSitter
if vim.api.nvim_call_function("has", { "nvim-0.8" }) == 1 then
    hl.treesitter = {
        ["@variable"] = { fg = c.peach, fmt = cfg.code_style.variables },
        ["@variable.builtin"] = { fg = c.blue, fmt = cfg.code_style.variables },
        ["@variable.parameter"] = { fg = c.red },
        ["@variable.member"] = { fg = c.red },

        ["@constant"] = { fg = c.cyan, fmt = cfg.code_style.constants },
        ["@constant.builtin"] = { fg = c.blue },
        ["@constant.builtin.boolean"] = { fg = c.cyan, fmt = "bold,italic" },
        ["@constant.macro"] = colors.Orange,

        ["@string"] = { fg = c.green, fmt = cfg.code_style.strings },
        ["@string.escape"] = colors.Blue,
        ["@string.special"] = colors.Blue,
        ["@string.special.symbol"] = colors.Red,
        ["@string.regexp"] = colors.Green,

        ["@character"] = colors.Blue,
        ["@number"] = colors.Yellow,
        ["@number.float"] = colors.Orange,
        ["@boolean"] = colors.Cyan,

        ["@function"] = { fg = c.red, fmt = cfg.code_style.functions },
        ["@function.builtin"] = { fg = c.cyan, fmt = cfg.code_style.functions },
        ["@function.macro"] = colors.Green,
        ["@function.method"] = { fg = c.blue },
        ["@constructor"] = { fg = c.blue },

        ["@keyword"] = { fg = c.blue, fmt = cfg.code_style.keywords },
        ["@keyword.control.conditional"] = { fg = c.red },
        ["@keyword.control.exception"] = colors.Purple,
        ["@keyword.control.import"] = { fg = c.red },
        ["@keyword.control.repeat"] = { fg = c.yellow },
        ["@keyword.control.return"] = colors.Blue,
        ["@keyword.function"] = colors.Blue,
        ["@keyword.operator"] = colors.Blue,
        ["@keyword.directive"] = colors.Purple,

        ["@operator"] = { fg = c.white },
        ["@punctuation.delimiter"] = colors.Mint,
        ["@punctuation.bracket"] = colors.Mint,
        ["@punctuation.special"] = colors.Mint,

        ["@comment"] = { fg = c.light_grey, fmt = cfg.code_style.comments },
        ["@comment.todo"] = { fg = c.red, fmt = cfg.code_style.comments },

        ["@tag"] = colors.Blue,
        ["@tag.attribute"] = colors.Blue,
        ["@tag.delimiter"] = colors.Blue,

        ["@type"] = colors.Yellow,
        ["@type.builtin"] = colors.Yellow,

        ["@attribute"] = colors.Blue,
        ["@property"] = colors.Cyan,
        ["@label"] = colors.Blue,
        ["@namespace"] = colors.Red,

        -- Markup
        ["@markup.strong"] = { fg = c.purple, fmt = "bold" },
        ["@markup.italic"] = { fg = c.yellow, fmt = "italic" },
        ["@markup.strikethrough"] = { fmt = "strikethrough" },
        ["@markup.underline"] = { fmt = "underline" },

        ["@markup.heading"] = { fg = c.blue, fmt = "bold" },
        ["@markup.quote"] = { fg = c.yellow, fmt = "italic" },
        ["@markup.math"] = colors.Fg,

        ["@markup.link.url"] = { fg = c.green },
        ["@markup.link.text"] = colors.Red,
        ["@markup.list"] = colors.Peach,
        ["@markup.raw"] = colors.Cyan,

        -- Diffs
        ["@diff.plus"] = colors.Green,
        ["@diff.minus"] = colors.Red,
        ["@diff.delta"] = colors.Purple,
    }
end

-- LSP
hl.plugins.lsp = {
    -- Diagnostics
    DiagnosticError = { fg = c.red },
    DiagnosticHint = { fg = c.green },
    DiagnosticInfo = { fg = c.blue },
    DiagnosticWarn = { fg = c.yellow },

    DiagnosticVirtualTextError = { fg = c.red, bg = cfg.diagnostics.background and c.bg1 or c.none },
    DiagnosticVirtualTextWarn = { fg = c.yellow, bg = cfg.diagnostics.background and c.bg1 or c.none },
    DiagnosticVirtualTextInfo = { fg = c.blue, bg = cfg.diagnostics.background and c.bg1 or c.none },
    DiagnosticVirtualTextHint = { fg = c.green, bg = cfg.diagnostics.background and c.bg1 or c.none },

    DiagnosticUnderlineError = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.red },
    DiagnosticUnderlineHint = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.green },
    DiagnosticUnderlineInfo = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.blue },
    DiagnosticUnderlineWarn = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.yellow },

    LspReferenceText = { bg = c.bg2 },
    LspReferenceWrite = { bg = c.bg2 },
    LspReferenceRead = { bg = c.bg2 },

    LspCodeLens = { fg = c.comment, fmt = cfg.code_style.comments },
    LspCodeLensSeparator = { fg = c.comment },
}

-- Popular plugins
hl.plugins.cmp = {
    CmpItemAbbr = colors.Fg,
    CmpItemAbbrDeprecated = { fg = c.light_grey, fmt = "strikethrough" },
    CmpItemAbbrMatch = colors.Cyan,
    CmpItemAbbrMatchFuzzy = { fg = c.cyan, fmt = "underline" },
    CmpItemMenu = colors.LightGrey,
    CmpItemKind = { fg = c.purple, fmt = cfg.cmp_itemkind_reverse and "reverse" },
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
    TelescopeMatching = { fg = c.orange, fmt = "bold" },
    TelescopePromptPrefix = colors.Green,
    TelescopeSelection = { bg = c.bg2 },
    TelescopeSelectionCaret = colors.Yellow,
}

hl.plugins.nvim_tree = {
    NvimTreeNormal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
    NvimTreeVertSplit = { fg = c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
    NvimTreeRootFolder = { fg = c.orange, fmt = "bold" },
    NvimTreeGitDirty = colors.Yellow,
    NvimTreeGitNew = colors.Green,
    NvimTreeGitDeleted = colors.Red,
    NvimTreeSpecialFile = { fg = c.yellow, fmt = "underline" },
    NvimTreeIndentMarker = colors.Fg,
    NvimTreeImageFile = { fg = c.purple },
    NvimTreeSymlink = colors.Purple,
    NvimTreeFolderName = colors.Blue,
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
        local fg = group_settings.fg and
        (group_settings.fg:sub(1, 1) == '$' and c[group_settings.fg:sub(2)] or group_settings.fg) or "none"
        local bg = group_settings.bg and
        (group_settings.bg:sub(1, 1) == '$' and c[group_settings.bg:sub(2)] or group_settings.bg) or "none"
        local sp = group_settings.sp and
        (group_settings.sp:sub(1, 1) == '$' and c[group_settings.sp:sub(2)] or group_settings.sp) or "none"

        vim.api.nvim_command(string.format("highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
            group_name, fg, bg, sp, group_settings.fmt or "none"))
    end
end

return M
