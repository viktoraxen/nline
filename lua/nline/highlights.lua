local M = {}

local highlights = {
    NLineModeNormal = "#89B4FA",
    NLineModeInsert = "#A6E3A1",
    NLineModeVisual = "#CBA6F7",
    NLineModeCommand = "#FAB387",
    NLineModeReplace = "#F38BA8",
}

function M.setup()
    -- -- Allow user to override the defaults
    -- local highlights = vim.tbl_deep_extend("force", M.highlights, config.highlights or {})

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
