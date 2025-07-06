local M = {}

local levels = {
    "Hint",
    "Info",
    "Warn",
    "Error",
}

M.config = {
    padding = 1,
    highlight = {
        ["Hint"] = "NLineHint",
        ["Info"] = "NLineInfo",
        ["Warn"] = "NLineWarn",
        ["Error"] = "NLineError",
    },
    icon = {
        ["Hint"] = "",
        ["Info"] = "",
        ["Warn"] = "",
        ["Error"] = "",
    }
}

M.state = {
    count = {
        ["Hint"] = 0,
        ["Info"] = 0,
        ["Warn"] = 0,
        ["Error"] = 0,
    }
}

M.text = function()
    local highlight = require("nline.utils").highlight

    local text = ""

    for _, level in ipairs(levels) do
        if M.state.count[level] ~= 0 then
            local icon = M.config.icon[level]
            local count = M.state.count[level]
            local group = M.config.highlight[level]

            if text ~= "" then
                text = text .. " "
            end

            text = text .. highlight(icon, group) .. " " .. count
        end
    end

    if text == "" then return "" end

    local padding = string.rep(" ", M.config.padding)

    return table.concat({
        padding,
        text,
        padding,
    })
end

M.update = function()
    for _, level in pairs(levels) do
        M.state.count[level] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
    end
end

M.update_on = {
    "BufEnter",
    "BufWritePost",
    "DiagnosticChanged"
}

return M
