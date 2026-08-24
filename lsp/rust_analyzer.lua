return {
	cmd = {"/Users/julian.cortes/.cargo/bin/rust-analyzer"},
	filetypes = { "rust" },
	root_markers = { "Cargo.toml", ".git" },
	settings = {
		["rust-analyzer"] = {
			cargo = { allFeatures = true },
			checkOnSave = true,
			check = { command = "clippy" },
		}
	}
}
