local ls = require("luasnip")

ls.add_snippets("go", {
  ls.parser.parse_snippet("trun", 't.Run("${1:name}", func(t *testing.T) {\n\t${0}\n})'),
})
