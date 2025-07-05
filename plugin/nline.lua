vim.api.nvim_create_augroup('Nline', { clear = true })

vim.api.nvim_create_autocmd('ColorScheme', {
    group    = 'Nline',
    desc     = "Update highlight groups",
    callback = function()
        require("nline.highlights").setup()
    end
})

-- vim.api.nvim_create_autocmd('BufEnter', {
--     group    = 'Nline',
--     callback = function()
--         local nline = require("nline")
--         -- nline.update_mode()
--         nline.update_filepath()
--         nline.update_filename()
--         nline.update_filetype()
--         nline.draw()
--     end
-- })
--
-- vim.api.nvim_create_autocmd('ModeChanged', {
--     group    = 'Nline',
--     callback = function()
--         local nline = require("nline")
--         nline.update_mode()
--         nline.draw()
--     end
-- })
