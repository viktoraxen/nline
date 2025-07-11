local M = {}

local texts = {
    ["n"] = "Normal",
    ["no"] = "Normal",
    ["v"] = "Visual",
    ["V"] = "Vi-Line",
    [""] = "Vi-Block",
    [""] = "Vi-Block",
    ["s"] = "Select",
    ["S"] = "Se-Line",
    ["i"] = "Insert",
    ["ic"] = "Insert",
    ["R"] = "Replace",
    ["Rv"] = "Vi-Replace",
    ["c"] = "Command",
    ["cv"] = "Vim Ex",
    ["ce"] = "Ex",
    ["r"] = "Prompt",
    ["rm"] = "Moar",
    ["r?"] = "Confirm",
    ["!"] = "Shell",
    ["t"] = "Terminal",
    ["nt"] = "Normal",
}

M.highlight_map = {
    ["n"] = "NLineModeNormal",
    ["no"] = "NLineModeNormal",
    ["v"] = "NLineModeVisual",
    ["V"] = "NLineModeVisual",
    [""] = "NLineModeVisual",
    [""] = "NLineModeVisual",
    ["s"] = "NLineModeVisual",
    ["S"] = "NLineModeVisual",
    ["i"] = "NLineModeInsert",
    ["ic"] = "NLineModeInsert",
    ["R"] = "NLineModeReplace",
    ["Rv"] = "NLineModeReplace",
    ["c"] = "NLineModeCommand",
    ["cv"] = "NLineModeCommand",
    ["ce"] = "NLineModeCommand",
    ["r"] = "NLineModeCommand",
    ["rm"] = "NLineModeNormal",
    ["r?"] = "NLineModeNormal",
    ["!"] = "NLineModeNormal",
    ["t"] = "NLineModeInsert",
    ["nt"] = "NLineModeNormal",
}

M.config = {
    width = 1,
    padding = 1,
}

M.state = {
    mode = "n"
}

M.text = function()
    local align = require("nline.utils").align
    local highlight = require("nline.utils").highlight

    local padding = string.rep(" ", M.config.padding)
    local text_width = M.config.width - 2 * M.config.padding

    local group = M.highlight_map[M.state.mode]

    return table.concat({
        padding,
        highlight(texts[M.state.mode], group),
        padding,
    })
end

M.update = function()
    M.state.mode = vim.api.nvim_get_mode().mode
end

M.update_on = {
    "BufEnter",
    "ModeChanged"
}

return M
