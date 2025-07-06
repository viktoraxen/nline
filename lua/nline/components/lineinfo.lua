local M = {}

M.config = {
    padding = 1,
}

M.text = function()
    local padding = string.rep(" ", M.config.padding)

    local highlight = require("nline.utils").highlight
    local mode_module = require("nline.components.mode")

    local highlight_map = mode_module.highlight_map
    local group = highlight_map[mode_module.state.mode]

    return table.concat({
        padding,
        highlight(" %P %l:%c", group),
        padding,
    })
end

M.update = function() end

M.update_on = {}

return M
