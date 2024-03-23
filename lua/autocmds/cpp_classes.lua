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
            "private:",
            "",
            "public:",
            "    " .. className .. "(); // constructor",
            "    " .. className .. "(const " .. className .. "& other); // copy constructor",
            "    " .. className .. "& operator=(const " .. className .. "& other); // copy assignment operator",
            "    ~" .. className .. "(); // destructor",
            "};",
            "",
            "#endif"
        }
        -- Insert the class definition into the new .hpp file
        vim.api.nvim_buf_set_lines(0, 0, -1, false, hppContent)
        vim.cmd("w")

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
        vim.cmd("e " .. cppFileName)
        vim.api.nvim_buf_set_lines(0, 0, -1, false, cppContent)
        vim.cmd("w")
        vim.cmd("bd")
    end,
})
