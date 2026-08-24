local ls = require("luasnip")

ls.add_snippets("kotlin", {
  -- Compose UI
  ls.parser.parse_snippet("comp", "@Composable\nfun ${1:MyComponent}(${2}) {\n\t${0}\n}"),
  ls.parser.parse_snippet("prev", "@Preview(showBackground = true)\n@Composable\nfun ${1:MyComponent}Preview() {\n\t${1:MyComponent}()\n}"),
  ls.parser.parse_snippet("col", "Column(\n\tmodifier = ${1:Modifier},\n) {\n\t${0}\n}"),
  ls.parser.parse_snippet("row", "Row(\n\tmodifier = ${1:Modifier},\n) {\n\t${0}\n}"),
  ls.parser.parse_snippet("box", "Box(\n\tmodifier = ${1:Modifier},\n) {\n\t${0}\n}"),
  ls.parser.parse_snippet("txt", "Text(text = \"${1}\", modifier = ${2:Modifier})"),
  ls.parser.parse_snippet("btn", "Button(onClick = { ${1} }) {\n\tText(\"${2:Click}\")\n}"),
  ls.parser.parse_snippet("stt", "var ${1:state} by remember { mutableStateOf(${2:false}) }"),
  ls.parser.parse_snippet("vm", "val ${1:viewModel}: ${2:MyViewModel} = viewModel()"),
  ls.parser.parse_snippet("flow", "val ${1:state} by ${2:viewModel}.${3:uiState}.collectAsState()"),
  -- ViewModel
  ls.parser.parse_snippet("vmclass", "class ${1:My}ViewModel : ViewModel() {\n\tprivate val _uiState = MutableStateFlow(${2:UiState()})\n\tval uiState: StateFlow<${2:UiState}> = _uiState.asStateFlow()\n\n\t${0}\n}"),
  -- General Kotlin
  ls.parser.parse_snippet("tfunc", "fun test${1:Name}() {\n\t${0}\n}"),
  ls.parser.parse_snippet("data", "data class ${1:Name}(\n\tval ${2:field}: ${3:String},\n)"),
  ls.parser.parse_snippet("sealed", "sealed class ${1:Result}<out T> {\n\tdata class Success<T>(val data: T) : ${1:Result}<T>()\n\tdata class Error(val message: String) : ${1:Result}<Nothing>()\n}"),
})
