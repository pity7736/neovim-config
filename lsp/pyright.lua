local function get_python_path()
	local venv = vim.env.VIRTUAL_ENV
	if venv then
		return venv .. "/bin/python"
	end
	return "/Library/Frameworks/Python.framework/Versions/3.12/bin/python3"
end

return {
	cmd = {"/Library/Frameworks/Python.framework/Versions/3.12/bin/pyright-langserver", "--stdio"},
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
	settings = {
		python = {
			pythonPath = get_python_path(),
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "openFilesOnly",
			}
		}
	}
}
