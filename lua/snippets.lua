local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local sn = ls.snippet_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

ls.add_snippets("all", {
    s("sn", fmt(
        [[
            s("{}", {})
            ]],
        {
            i(1, "trigger"),
            i(2, "snippet")
        }
    )
    ),
    s("end", {
        t("<< std::endl")
    }),
    s("str", {
        t("std::string")
    }),
    s("mn", fmt(
        [[
            int main() {{
                {}
                return 0;
            }}
            ]],
        {
            i(1, "")
        }
    )
    ),
    s("fi", fmt(
        [[
            for (int i = 0; {}; i++) {{
                {}
            }}
            ]],
        {
            i(1, "condition"),
            i(2, "body")
        }
    )
    ),
    s("autocmd", fmt(
        [[
        vim.api.nvim_create_autocmd("{}", {{
            group = {},
            pattern = "{}",
            callback = function()
                {}
            end,
        }})
        ]],
        {
            i(1, "event"),
            i(2, "group"),
            i(3, "pattern"),
            i(4, "action")
        }
    )
    )
})
