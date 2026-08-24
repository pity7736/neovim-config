local ls = require("luasnip")

ls.add_snippets("rust", {
  ls.parser.parse_snippet("tfunc", "#[test]\nfn ${1:name}() {\n\t${0}\n}"),
})
