local cppClassGroup = vim.api.nvim_create_augroup("CPPClassGeneration", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
    group = cppClassGroup,
    pattern = "*.hpp",
    callback = function()
        -- Extract the class name from the filename (without extension)
        local className = vim.fn.expand("%:t:r")
        -- Prepare the class definition in Orthodox Canonical Form for the header file
        local hppContent = {
            "#ifndef " .. className:upper() .. "_HPP",
            "#define " .. className:upper() .. "_HPP",
            "",
            "class " .. className .. " {",
            "public:",
            "    " .. className .. "();",
            "    " .. className .. "(const " .. className .. "& other);",
            "    " .. className .. "& operator=(const " .. className .. "& other);",
            "    ~" .. className .. "();",
            "};",
            "",
            "#endif"
        }
        -- Insert the class definition into the new .hpp file
        vim.api.nvim_buf_set_lines(0, 0, -1, false, hppContent)

        -- Prepare the .cpp file content with method definitions
        local cppFileName = vim.fn.expand("%:p:h") .. "/" .. className .. ".cpp"
        local cppContent = {
            "#include \"" .. className .. ".hpp\"",
            "",
            "// Default constructor implementation",
            className .. "::" .. className .. "() {",
            "}",
            "",
            "// Copy constructor implementation",
            className .. "::" .. className .. "(const " .. className .. "& other) {",
            "}",
            "",
            "// Copy assignment operator implementation",
            className .. "& " .. className .. "::operator=(const " .. className .. "& other) {",
            "    return *this;",
            "}",
            "",
            "// Destructor implementation",
            className .. "::~" .. className .. "() {",
            "}"
        }
        -- Use Vim command to open new buffer for .cpp file, insert content, and save
        vim.cmd("e " .. cppFileName)                        -- Open or create the .cpp file in a new buffer
        vim.api.nvim_buf_set_lines(0, 0, -1, false, cppContent) -- Insert the content
        vim.cmd("w")                                        -- Save the file
        vim.cmd("bd")                                       -- Close the buffer
    end,
})
