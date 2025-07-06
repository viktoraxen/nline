local M = {}

M.config = {
    padding = 1,
    inactive_filetypes = {
        "neo-tree",
        "snacks_terminal",
        "snacks_picker_input",
        "snacks_picker_preview",
        "snacks_notif",
        "cmp_menu",
    }
}

M.state = {
    filename = ""
}

M.text = function()
    if vim.tbl_contains(M.config.inactive_filetypes, vim.bo.ft) then return "" end

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
