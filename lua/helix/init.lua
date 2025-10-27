local M = {}

---Change theme option
---@param opt string: option name
---@param value any: new value
function M.set_options(opt, value)
    local cfg = vim.g.helix_config
    cfg[opt] = value
    vim.g.helix_config = cfg
end

---Apply the colorscheme
function M.colorscheme()
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end
    vim.o.termguicolors = true
    vim.g.colors_name = "helix"

    require('helix.highlights').setup()
    require('helix.terminal').setup()
end

local default_config = {
    -- Main options --
    transparent = false,          -- don't set background
    term_colors = true,           -- if true enable the terminal
    ending_tildes = false,        -- show the end-of-buffer tildes
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

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
    colors = {},     -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Related --
    diagnostics = {
        darker = false,
        undercurl = true,
        background = false,
    },
}

---Setup theme options, without applying colorscheme
---@param opts table: a table containing options
function M.setup(opts)
    if not vim.g.helix_config or not vim.g.helix_config.loaded then
        vim.g.helix_config = vim.tbl_deep_extend('keep', vim.g.helix_config or {}, default_config)
        M.set_options('loaded', true)
    end
    if opts then
        vim.g.helix_config = vim.tbl_deep_extend('force', vim.g.helix_config, opts)
    end
end

function M.load()
    M.colorscheme()
end

return M
