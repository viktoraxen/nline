local M = {}

M.config = {
    padding = 1,
}

M.state = {
    filename = ""
}

M.text = function()
    if M.state.filename == "" then return "" end

    local text = string.format("󰧮 %s", M.state.filename)

    local padding = string.rep(" ", M.config.padding)

    return table.concat({ padding, text, padding, })
end

M.update = function()
    M.state.filename = vim.fn.expand("%:t"):gsub("\\w", "")
end

M.update_on = {
    "BufEnter"
}

return M
