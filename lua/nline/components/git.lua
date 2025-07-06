local M = {}

M.config = {
    min_width = 10,
    padding = 1,
    highlight = "NLineGitBranch",
    branch_icon = " "
}

M.state = {
    branch = ""
}

M.text = function()
    if vim.tbl_contains({
            "",
            "fatal: not a git repository (or any of the parent directories): .git"
        }, M.state.branch) then
        return ""
    end

    local highlight = require("nline.utils").highlight

    local padding = string.rep(" ", M.config.padding)

    local text = table.concat({
        M.config.branch_icon,
        M.state.branch
    })

    return table.concat({
        padding,
        highlight(text, M.config.highlight),
        padding
    })
end

local get_branch = function()
    local raw_output = vim.fn.system("git rev-parse --abbrev-ref HEAD")
    return string.gsub(raw_output, "^%s*(.-)%s*$", "%1")
end

M.update = function()
    M.state.branch = get_branch()
end

M.update_on = {
    "BufEnter",
    "DirChanged",
}

return M
