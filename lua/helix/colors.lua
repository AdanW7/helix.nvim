-- Color palette for Helix theme
local M = {}

M.palette = {
    -- Main colors
    background = "#141b1e",
    charcoal = "#1f1f1f",
    foreground = "#dadada",

    -- Base colors
    black = "#232a2d",
    ["black-light"] = "#2d3437",
    white = "#b3b9b8",
    ["white-light"] = "#bdc3c2",

    -- Primary colors
    red = "#e57474",
    ["red-light"] = "#ef7e7e",
    green = "#8ccf7e",
    ["green-light"] = "#96d988",
    yellow = "#e5c76b",
    ["yellow-light"] = "#f4d67a",
    blue = "#67b0e8",
    ["blue-light"] = "#71baf2",
    magenta = "#c47fd5",
    ["magenta-light"] = "#ce89df",
    cyan = "#6cbfbf",
    ["cyan-light"] = "#67cbe7",

    -- Special colors
    orange = "#ffb366",
    peach = "#f2b5a7",
    mint = "#5de6a8",
    lavendar = "#c8a8e8",
    coral = "#FF7F50",
    ["soft-teal"] = "#a8d4d4",

    -- UI colors
    comment = "#7a7c7e",
    ["light-comment"] = "#8a8c8e",
    ["dark-comment"] = "#404749",
    grey = "#505557",
    ["light-charcoal"] = "#2f2f2f",
    contrast = "#161d1f",
    cursorline = "#2c3333",

    -- Special
    none = "NONE",
}

-- Set active colors based on palette
function M.setup()
    local p = M.palette

    return {
        -- Background & Foreground
        bg0 = p.charcoal,
        bg1 = p["light-charcoal"],
        bg2 = p.black,
        bg3 = p["black-light"],
        bg_d = p.background,
        fg = p.foreground,

        -- Core colors
        black = p.black,
        red = p.red,
        green = p.green,
        yellow = p.yellow,
        blue = p.blue,
        purple = p.magenta,
        cyan = p.cyan,
        white = p.white,
        orange = p.orange,

        -- Light variants
        light_grey = p["light-comment"],
        grey = p.comment,
        dark_grey = p["dark-comment"],

        -- UI specific
        bg_blue = p.blue,
        bg_yellow = p.yellow,
        cursorline = p.cursorline,

        -- Diff colors
        diff_add = "#273d27",
        diff_delete = "#3d2727",
        diff_change = "#273347",
        diff_text = "#2d475d",

        -- Dark variants for diagnostics
        dark_red = p.red,
        dark_yellow = p.yellow,
        dark_cyan = p.cyan,
        dark_purple = p.magenta,

        -- Special colors
        peach = p.peach,
        mint = p.mint,
        lavendar = p.lavendar,

        none = p.none,
    }
end

return M
