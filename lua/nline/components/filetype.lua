local M = {}

M.config = {
    padding = 1,
    inactive_filetypes = {
        "neo-tree",
        "snacks_terminal",
        "snacks_picker_input",
        "snacks_picker_preview",
        "snacks_notif",
        "cmp-menu",
    }
}

M.state = {
    filetype = ""
}

M.text = function()
    if vim.tbl_contains(M.config.inactive_filetypes, M.state.filetype) then return "" end

    if M.state.filetype == "" then return "" end

    local highlight = require("nline.utils").highlight

    local padding = string.rep(" ", M.config.padding)

    local devicons = require("nvim-web-devicons")
    local icon, group = devicons.get_icon_by_filetype(M.state.filetype, { default = true })

    return table.concat({
        padding,
        highlight(icon, group),
        " ",
        M.state.filetype,
        padding,
    })
end

M.update = function()
    M.state.filetype = vim.bo.filetype
end

M.update_on = {
    "BufEnter",
    "Filetype"
}

return M
