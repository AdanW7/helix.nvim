---@alias HelixStyle '"bold"'|'"italic"'|'"underline"'|'"undercurl"'|'"strikethrough"'|'"reverse"'|'"none"'|string

---@class HelixCodeStyle
---@field comments HelixStyle
---@field keywords HelixStyle
---@field functions HelixStyle
---@field strings HelixStyle
---@field variables HelixStyle
---@field constants HelixStyle

---@class HelixCodeStyleOverride
---@field comments? HelixStyle
---@field keywords? HelixStyle
---@field functions? HelixStyle
---@field strings? HelixStyle
---@field variables? HelixStyle
---@field constants? HelixStyle

---@class HelixDiagnosticsConfig
---@field undercurl boolean
---@field background boolean

---@class HelixDiagnosticsConfigOverride
---@field undercurl? boolean
---@field background? boolean

---@class HelixHighlight
---@field fg? string
---@field bg? string
---@field sp? string
---@field fmt? HelixStyle

---@alias HelixHighlightMap table<string, HelixHighlight>

---@class HelixConfig
---@field loaded? boolean
---@field transparent boolean
---@field term_colors boolean
---@field ending_tildes boolean
---@field code_style HelixCodeStyle
---@field colors table<string, string>
---@field highlights HelixHighlightMap
---@field diagnostics HelixDiagnosticsConfig

---@class HelixConfigOverride
---@field loaded? boolean
---@field transparent? boolean
---@field term_colors? boolean
---@field ending_tildes? boolean
---@field code_style? HelixCodeStyleOverride
---@field colors? table<string, string>
---@field highlights? HelixHighlightMap
---@field diagnostics? HelixDiagnosticsConfigOverride

---@class HelixModule
---@field set_options fun(opt: string, value: any)
---@field colorscheme fun()
---@field setup fun(opts?: HelixConfigOverride)
---@field load fun()

local M = {}

---Change theme option
---@param opt string option name
---@param value any new value
function M.set_options(opt, value)
  ---@type HelixConfig|table<string, any>
  local cfg = vim.g.helix_config
  cfg[opt] = value
  vim.g.helix_config = cfg
end

---Apply the colorscheme
---@return nil
function M.colorscheme()
  vim.cmd('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end
  vim.o.termguicolors = true
  vim.g.colors_name = 'helix'

  require('helix.highlights').setup()
  require('helix.terminal').setup()
end

local default_config = {
  -- Main options --
  transparent = false, -- don't set background
  term_colors = true, -- if true enable the terminal
  ending_tildes = true, -- show the end-of-buffer tildes

  -- Changing Formats --
  code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none',
    constants = 'none',
  },

  -- Custom Highlights --
  colors = {}, -- Override default colors
  highlights = {}, -- Override highlight groups

  -- Plugins Related --
  diagnostics = {
    undercurl = true,
    background = false,
  },
}

---Setup theme options, without applying colorscheme
---@param opts? HelixConfigOverride a table containing options
---@return nil
function M.setup(opts)
  if not vim.g.helix_config or not vim.g.helix_config.loaded then
    vim.g.helix_config = vim.tbl_deep_extend('keep', vim.g.helix_config or {}, default_config)
    M.set_options('loaded', true)
  end
  if opts then
    vim.g.helix_config = vim.tbl_deep_extend('force', vim.g.helix_config, opts)
  end
end

---@return nil
function M.load()
  M.colorscheme()
end

---@cast M HelixModule
return M
