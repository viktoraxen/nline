local M = {}

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
