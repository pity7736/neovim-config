local ls = require("luasnip")

ls.add_snippets("go", {
  ls.parser.parse_snippet("trun", 't.Run("${1:name}", func(t *testing.T) {\n\t${0}\n})'),
  ls.parser.parse_snippet(
    "ttest",
    'tests := []struct {\n\tname string\n\t${1:input} ${2:int}\n\twant ${3:int}\n}{\n\t{\n\t\tname: "${4:case}",\n\t\t$1:   ${5:0},\n\t\twant: ${6:0},\n\t},\n}\nfor _, tt := range tests {\n\tt.Run(tt.name, func(t *testing.T) {\n\t\t${0}\n\t})\n}'
  ),
  ls.parser.parse_snippet("iferr", "if err != nil {\n\treturn ${1:err}\n}"),
  ls.parser.parse_snippet("tfunc", "func Test${1:Name}(t *testing.T) {\n\t${0}\n}"),
})
