local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local sn = ls.snippet_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

ls.add_snippets("lua", {
    s("sn", fmta(
        [[
            s("<trigger>", <snippet>)
            ]],
        {
            trigger = i(1, "trigger"),
            snippet = i(2, "snippet")
        }
    )
    ),
    s("autocmd", fmta(
        [[
        vim.api.nvim_create_autocmd("<event>", {
            group = <group>,
            pattern = "<pattern>",
            callback = function()
                <body>
            end,
        })
        ]],
        {
            event = i(1, "event"),
            group = i(2, "group"),
            pattern = i(3, "*"),
            body = i(4, "body")
        }
    )
    )
})

ls.add_snippets("cpp", {
    s("end", {
        t("<< std::endl")
    }),
    s("cerr", fmta(
        [[
        std::cerr << <message>;
        ]],
        {
            message = i(1, "message")
        }
    )),
    s("str", {
        t("std::string")
    }),
    s("mn", fmta(
        [[
            int main() {
                <body>
                return 0;
            }
            ]],
        {
            body = i(1, "")
        }
    )
    ),
    s("fi", fmt(
        [[
            for (int i = 0; i < {}; i++) {{
                {}
            }}
            ]],
        {
            i(1, "N"),
            i(2, "body")
        }
    )
    ),
    s("fn", fmta(
        [[
        <returnType> <functionName>(<parameters>)<isConst> {
            <body>
        }
        ]],
        {
            returnType = c(1, {
                t(""),
                t("void"),
                t("int"),
                t("bool"),
                t("std::string"),
                t("const std::string"),
                t("const std::string&"),
            }
            ),
            functionName = i(2, "name"),
            parameters = i(3, "void"),
            isConst = c(4, { t(" const"), t("") }),
            body = i(5, "// TODO: implement function")
        }
    )
    ),
    s("fnd", fmta(
        [[
        <returnType> <functionName>(<parameters>)<isConst>;
        ]],
        {
            returnType = c(1, {
                t(""),
                t("void"),
                t("int"),
                t("bool"),
                t("std::string"),
                t("const std::string"),
                t("const std::string&"),
            }
            ),
            functionName = i(2, "name"),
            parameters = i(3, "void"),
            isConst = c(4, { t(" const"), t("") }),
        }
    )
    ),
    s("ter", fmt(
        [[
        {} ? {} : {};
        ]],
        {
            i(1, "condition"),
            i(2, "1"),
            i(3, "0")
        }
    )),
})

ls.add_snippets("go", {
    s("ien", fmt(
        [[
        if err != nil {{
            {}
        }}
        ]],
        {
            i(1, "return")
        }
    ))
})
