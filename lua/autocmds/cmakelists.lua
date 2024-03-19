local cmakeGroup = vim.api.nvim_create_augroup("CMakeGeneration", { clear = true })

vim.api.nvim_create_autocmd("BufNewFile", {
    group = cmakeGroup,
    pattern = "CMakeLists.txt",
    callback = function()
        -- Prompt the user for the project name
        local projectName = vim.fn.input("Project Name: ")
        -- Prepare the CMakeLists.txt content
        local cmakeContent = {
            "cmake_minimum_required(VERSION 3.10)",
            "",
            "project(" .. projectName .. ")",
            "",
            "set(CMAKE_CXX_STANDARD 98)",
            "set(CMAKE_CXX_STANDARD_REQUIRED ON)",
            "set(CMAKE_CXX_EXTENSIONS OFF)",
            "",
            "set(CMAKE_CXX_FLAGS \"${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror\")",
            "",
            "file(GLOB SOURCES \"*.cpp\")",
            "add_executable(" .. projectName .. " ${SOURCES})",
            "",
        }

        -- Insert the content into the new CMakeLists.txt file
        vim.api.nvim_buf_set_lines(0, 0, -1, false, cmakeContent)
    end,
})
