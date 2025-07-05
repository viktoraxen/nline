M = {}

M.config = {
    components = {
        left = {
            "mode",
            "filename",
            "filepath"
        },
        right = {
            "filetype",
            "lineinfo"
        }
    },
    hide_filetypes = {
        "alpha",
    },
    disable_filetypes = {
        "snacks_notif"
    }
}

local get_modules = function(components)
    local modules = {}

    for _, component in pairs(components) do
        local ok, module = pcall(require, "nline.components." .. component)

        if not ok then
            vim.notify(string.format("Could not find component %q", component), "error")
        else
            modules[component] = module
        end
    end

    return modules
end

local autocommands = function(components)
    local autocommands = {}

    for _, module in pairs(get_modules(components)) do
        for _, event in ipairs(module.update_on) do
            if not autocommands[event] then
                autocommands[event] = {}
            end

            table.insert(autocommands[event], module)
        end
    end

    return autocommands
end

local build_line = function(components)
    local texts = {}
    local modules = get_modules(components)

    for _, component in ipairs(components) do
        local module = modules[component]
        local text = module.text()

        table.insert(texts, text)
    end

    return table.concat(texts)
end

local line = function()
    local left_line = build_line(M.config.components.left)
    local right_line = build_line(M.config.components.right)

    return table.concat({
        left_line, "%=", right_line
    })
end

M.draw = function()
    if vim.tbl_contains(M.config.hide_filetypes, vim.bo.ft) then
        vim.o.laststatus = 0
        return
    end

    vim.o.statusline = line()
end

M.setup = function(opts)
    require("nline.highlights").setup()
    local utils = require("nline.utils")

    M.config = vim.tbl_deep_extend('force', M.config, opts)

    local components = utils.concat(M.config.components.left, M.config.components.right)

    for event, modules in pairs(autocommands(components)) do
        vim.api.nvim_create_autocmd(event, {
            group    = 'Nline',
            callback = function()
                if vim.tbl_contains(M.config.disable_filetypes, vim.bo.ft) then return end

                vim.opt.laststatus = 3

                for _, module in pairs(modules) do
                    module.update()
                end

                M.draw()
            end
        })
    end

    vim.api.nvim_create_autocmd("UIEnter", {
        group    = 'Nline',
        callback = function()
            M.draw()
        end
    })
end

return M
