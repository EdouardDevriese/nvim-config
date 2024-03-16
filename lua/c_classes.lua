local cClassGroup = vim.api.nvim_create_augroup("CClassGeneration", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
    group = cClassGroup,
    pattern = "*.h",
    callback = function()
        -- Extract the class name from the filename (without extension)
        local headerName = vim.fn.expand("%:t:r")
        -- Prepare the class definition in Orthodox Canonical Form for the header file
        local hContent = {
            "#ifndef " .. headerName:upper() .. "_H",
            "# define " .. headerName:upper() .. "_H",
            "",
            "",
            "",
            "#endif //" .. headerName:upper() .. "_H"
        }
        -- Insert the class definition into the new .hpp file
        vim.api.nvim_buf_set_lines(0, 0, -1, false, hContent)
    end,
})
