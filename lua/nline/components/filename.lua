local M = {}

M.config = {
    width = 10,
    padding = 1,
}

M.state = {
    filename = ""
}

M.text = function()
    if M.state.filename == "" then return "" end
    local text = string.format("󰧮 %s", M.state.filename)

    local align = require("nline.utils").align

    local padding = string.rep(" ", M.config.padding)
    local text_width = M.config.width - 2 * M.config.padding

    return table.concat({
        padding,
        align(text, text_width, "left"),
        padding,
    })
end

M.update = function()
    M.state.filename = vim.fn.expand("%:t"):gsub("\\w", "")
end

M.update_on = {
    "BufEnter"
}

return M
