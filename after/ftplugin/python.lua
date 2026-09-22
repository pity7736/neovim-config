local ls = require("luasnip")

ls.add_snippets("python", {
  ls.parser.parse_snippet("def", "def ${1:name}(${2:self}):\n\t${0}"),
  ls.parser.parse_snippet("ifmain", 'if __name__ == "__main__":\n\t${0:main()}'),
  ls.parser.parse_snippet("tfunc", "def test_${1:name}(${2}):\n\t${0}"),
  ls.parser.parse_snippet("tclass", "class Test${1:Name}:\n\tdef test_${2:method}(self):\n\t\t${0}"),
  ls.parser.parse_snippet("with", "with ${1:expr} as ${2:var}:\n\t${0}"),
})
