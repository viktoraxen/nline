local M = {}

M.config = {
    width = 10,
    padding = 1,
}

M.state = {
    filepath = ""
}

M.text = function()
    if M.state.filepath == "" then return "" end

    local align = require("nline.utils").align

    local text = string.format("  %s", M.state.filepath)

    local padding = string.rep(" ", M.config.padding)
    local text_width = M.config.width - 2 * M.config.padding

    return table.concat({
        padding,
        align(text, text_width, "left"),
        padding,
    })
end

M.update = function()
    local path = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")

    if path == "." or path == " " then
        path = ""
    end

    M.state.filepath = path
end

M.update_on = {
    "BufEnter"
}

return M
