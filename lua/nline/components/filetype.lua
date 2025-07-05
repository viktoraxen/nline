local M = {}

M.state = {
    filetype = ""
}

M.text = function()
    if M.state.filetype == "" then return "" end

    local devicons = require("nvim-web-devicons")
    local icon, highlight = devicons.get_icon_by_filetype(M.state.filetype, { default = true })

    return table.concat({
        "%#" .. highlight .. "#",
        icon,
        "%## ",
        M.state.filetype,
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
