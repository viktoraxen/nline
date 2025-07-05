vim.api.nvim_create_augroup('Nline', { clear = true })

vim.api.nvim_create_autocmd('ColorScheme', {
    group    = 'Nline',
    desc     = "Update highlight groups",
    callback = function()
        require("nline.highlights").setup()
    end
})
