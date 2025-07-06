local M = {}

local highlights = {
    NLineModeNormal = "#89B4FA",  -- blue
    NLineModeInsert = "#A6E3A1",  -- green
    NLineModeVisual = "#CBA6F7",  -- mauve
    NLineModeCommand = "#FAB387", -- peach
    NLineModeReplace = "#F38BA8", -- red
    NLineGitBranch = "#9399b2",   -- overlay2
    NLineFilePath = "#9399b2",    -- overlay2
}

function M.setup()
    local normal_hl_decimal = vim.api.nvim_get_hl(0, { name = "Normal" })

    local normal_hl = {
        bg = string.format("#%06x", normal_hl_decimal.bg),
        fg = string.format("#%06x", normal_hl_decimal.fg),
    }

    vim.api.nvim_set_hl(0, "StatusLine", normal_hl)

    for group, fg in pairs(highlights) do
        local style = {
            bg = normal_hl.bg,
            fg = fg
        }

        vim.api.nvim_set_hl(0, group, style)
    end
end

return M
