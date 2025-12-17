return {
	cmd = {"/Users/julian.cortes/go/bin/gopls"},
	filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
	root_markers = { "go.mod", ".git" },
	settings = {
		gopls = {
			usePlaceholders = true,
			completeUnimported = true,
			staticcheck = true,
			directoryFilters = { "-.git", "-.idea" },
			semanticTokens = true,
            analyses = {
                ST1000 = false, -- ST1000: Incorrect or missing package comment
                ST1006 = false, -- ST1006: Poorly chosen receiver name (i want to use self as a receiver name)
            },
		}
	}
}

