return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	lazy = "true",
	config = function()
		local jdtls = require("jdtls")
		local jdtls_dap = require("jdtls.dap")
		local jdtls_setup = require("jdtls.setup")
		local home = os.getenv("HOME")
		local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
		local root_dir = jdtls_setup.find_root(root_markers)
		local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
		local path_to_mason_packages = home .. "/.local/share/nvim/mason/packages"
		local path_to_jdtls = path_to_mason_packages .. "/jdtls"
		local path_to_jdebug = path_to_mason_packages .. "/java-debug-adapter"
		local path_to_jtest = path_to_mason_packages .. "/java-test"
		local path_to_config = path_to_jdtls .. "/config_linux"
		local lombok_path = path_to_jdtls .. "/lombok.jar"
		local path_to_jar = path_to_jdtls .. "/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar"
		local workspace_dir = home .. "/.cache/jdtls/workspace" .. project_name
		local bundles = {
			vim.fn.glob(path_to_jdebug .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", true),
		}
		vim.list_extend(bundles, vim.split(vim.fn.glob(path_to_jtest .. "/extension/server/*.jar", true), "\n"))

		local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
		extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

		local config = {
			handlers = {
				["$/progress"] = function() end,
			},
			cmd = {
				-- "java" -- if java is in your path
				"/usr/lib/jvm/java-21-openjdk-amd64/bin/java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=WARN",
				"-Xmx1g",
				"-javaagent:" .. lombok_path,
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				path_to_jar,
				"-configuration",
				path_to_config,
				"-data",
				workspace_dir,
			},
			settings = {
				java = {
					references = {
						includeDecompiledSources = true,
					},
					format = {
						enabled = false,
					},
					eclipse = {
						downloadSources = true,
					},
					maven = {
						downloadSources = true,
					},
					signatureHelp = { enabled = true },
					contentProvider = { preferred = "fernflower" },
					implementationsCodeLens = {
						enabled = true,
					},
					completion = {
						favoriteStaticMembers = {
							"org.hamcrest.MatcherAssert.assertThat",
							"org.hamcrest.Matchers.*",
							"org.hamcrest.CoreMatchers.*",
							"org.junit.jupiter.api.Assertions.*",
							"java.util.Objects.requireNonNull",
							"java.util.Objects.requireNonNullElse",
							"org.mockito.Mockito.*",
						},
						filteredTypes = {
							"com.sun.*",
							"io.micrometer.shaded.*",
							"java.awt.*",
							"jdk.*",
							"sun.*",
						},
						importOrder = {
							"java",
							"javax",
							"com",
							"org",
						},
					},
					sources = {
						organizeImports = {
							starThreshold = 9999,
							staticStarThreshold = 9999,
						},
					},
					codeGeneration = {
						toString = {
							template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
						},
						useBlocks = true,
					},
					project = {
						referencedLibraries = {
							"**/lib/*.jar",
						},
					},
				},
			},
			flags = {
				allow_incremental_sync = true,
			},
			on_attach = function(_, bufnr)
				jdtls.setup_dap({ hotcodereplace = "auto" })
				jdtls_dap.setup_dap_main_class_configs()
				jdtls_setup.add_commands()
				require("lsp_signature").on_attach({
					bind = true,
					padding = "",
					handler_opts = {
						border = "rounded",
					},
					hint_prefix = "󱄑 ",
				}, bufnr)
				require("lspsaga").init_lsp_saga()
			end,
			init_options = {
				bundles = bundles,
				extendedClientCapabilities = extendedClientCapabilities,
			},
		}

		jdtls.start_or_attach(config)
	end,
}
