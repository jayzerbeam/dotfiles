local home = os.getenv("HOME")
local path_to_jdtls = home .. "/.local/share/nvim/mason/packages/jdtls/bin/jdtls"
local config = {
	cmd = { path_to_jdtls },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
require("jdtls").start_or_attach(config)
