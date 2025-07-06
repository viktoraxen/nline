local M = {}

local highlights = {
    NLineModeNormal = "#89B4FA",  -- blue
    NLineModeInsert = "#A6E3A1",  -- green
    NLineModeVisual = "#CBA6F7",  -- mauve
    NLineModeCommand = "#FAB387", -- peach
    NLineModeReplace = "#F38BA8", -- red
    NLineGitBranch = "Comment",
    NLineFilePath = "Comment",
    NLineHint = "DiagnosticHint",
    NLineInfo = "DiagnosticInfo",
    NLineWarn = "DiagnosticWarn",
    NLineError = "DiagnosticError",
}

function M.setup()
    local normal_hl_decimal = vim.api.nvim_get_hl(0, { name = "Normal" })

    local normal_hl = {
        bg = string.format("#%06x", normal_hl_decimal.bg),
        fg = string.format("#%06x", normal_hl_decimal.fg),
    }

    vim.api.nvim_set_hl(0, "StatusLine", normal_hl)

    for group, hl in pairs(highlights) do
        local fg = hl

        if not string.match(fg, "^#") then
            local link = vim.api.nvim_get_hl(0, { name = hl })
            fg = string.format("#%06x", link.fg)
        end

        local style = {
            bg = normal_hl.bg,
            fg = fg
        }

        vim.api.nvim_set_hl(0, group, style)
    end
end

return M
