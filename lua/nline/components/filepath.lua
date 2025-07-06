local M = {}

M.config = {
    padding = 1,
    highlight = "NLineFilePath",
    inactive_modes = { "t", "nt" }
}

M.state = {
    filepath = ""
}

M.text = function()
    if vim.tbl_contains(M.config.inactive_modes, vim.api.nvim_get_mode().mode) then
        return ""
    end

    if M.state.filepath == "" then return "" end

    local highlight = require("nline.utils").highlight

    local text = string.format(" %s", M.state.filepath)

    local padding = string.rep(" ", M.config.padding)

    return table.concat({
        padding,
        highlight(text, M.config.highlight),
        padding,
    })
end

M.update = function()
    local path = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h"):gsub("[.]/?", "")

    if path == "." or path == " " then
        path = ""
    end

    M.state.filepath = path
end

M.update_on = {
    "BufEnter"
}

return M
