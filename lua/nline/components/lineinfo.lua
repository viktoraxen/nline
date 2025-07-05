local M = {}

M.config = {
    width = 15,
    padding = 1,
}

M.text = function()
    local align = require("nline.utils").align

    local padding = string.rep(" ", M.config.padding)
    local text_width = M.config.width - 2 * M.config.padding
    local mode_module = require("nline.components.mode")
    local highlight_map = mode_module.highlight_map
    local highlight = highlight_map[mode_module.state.mode]

    return table.concat({
        "%#" .. highlight .. "#",
        padding,
        align(" %P %l:%c", text_width, "right"),
        padding,
        "%##"
    })
end

M.update = function() end

M.update_on = {}

return M
