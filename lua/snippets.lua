local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local sn = ls.snippet_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

local snippet_generator = s("sn", {
    t("local "), i(1, "name"), t(" = s(\""), i(2, "to_expand"), t("\", {"), i(3, ""), t("})")
})

ls.add_snippets("all", { snippet_generator })
