return {
	cmd = { "kotlin-lsp", "--stdio" },
	filetypes = { "kotlin" },
	root_markers = { "settings.gradle", "settings.gradle.kts", "build.gradle", "build.gradle.kts", ".git" },
	settings = {
		kotlin = {
			compiler = {
				jvm = {
					target = "17",
				},
			},
		},
	},
}
