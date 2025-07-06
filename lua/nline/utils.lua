local M = {}

M.highlight = function(text, group)
    return table.concat({
        "%#" .. group .. "#",
        text,
        "%##",
    })
end

M.pad = function(text, min_width, left_pad, right_pad)
    local left_padding = string.rep(" ", left_pad)
    local right_padding = string.rep(" ", right_pad)
    local text_width = min_width - (left_pad + right_pad)

    return table.concat({
        left_padding,
        text,
        right_padding
    })
end

M.align = function(text, width, dir)
    if not text then return string.rep(" ", width) end

    local padding = string.rep(" ", width - text:len())

    if dir == "left" then
        return table.concat({ text, padding })
    elseif dir == "right" then
        return table.concat({ padding, text })
    end

    local left = string.rep(" ", (width - text:len()) / 2)
    local right = string.rep(" ", 1 + (width - text:len()) / 2)

    return table.concat({ left, text, right })
end

M.concat = function(table1, table2)
    local result = {}

    for _, v in pairs(table1) do
        table.insert(result, v)
    end

    for _, v in pairs(table2) do
        table.insert(result, v)
    end

    return result
end

return M
