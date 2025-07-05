local M = {}

M.state = {
    filetype = ""
}

M.text = function()
    return M.state.filetype
end

M.update = function()
    M.state.filetype = vim.bo.filetype
end

M.update_on = {
    "BufEnter"
}

return M
