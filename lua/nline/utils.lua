local M = {}

M.highlight = function(text, group)
    if not group then
        if text then return text end
        return ""
    end

    return table.concat({
        "%#" .. group .. "#",
        text,
        "%##",
    })
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
