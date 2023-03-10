local function prequire(...)
	local status, lib = pcall(require, ...)
	if status then
		return lib
	end
	return nil
end

local nvim_lsp = prequire("lspconfig")
local capabilities = require("afnan.lsp.utils").capabilities()
local on_attach = require("afnan.lsp.utils").on_attach

nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		completions = {
			completeFunctionCalls = true,
		},
	},
	init_options = {
		preferences = {
			includeCompletionsWithSnippetText = true,
			includeCompletionsForImportStatements = true,
		},
	},
	root_dir = function()
		return vim.loop.cwd()
	end,
	single_file_support = true,
})

nvim_lsp.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.eslint.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		eslint = {
			enable = true,
			packageManager = "yarn",
			autoFixOnSave = true,
			codeActionsOnSave = {
				mode = "all",
				rules = { "!debugger", "!no-only-tests/*" },
			},
			lintTask = { enable = true },
		},
	},
})

nvim_lsp.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = { provideFormatter = false },
	single_file_support = true,
	settings = {
		json = { schemas = require("schemastore").json.schemas() },
	},
})

nvim_lsp.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		yaml = {
			schemas = require("schemastore").json.schemas(),
			hover = true,
			completion = true,
			validate = true,
		},
	},
})

nvim_lsp.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "it", "describe", "before_each", "self" },
				disable = { "trailing-space", "deprecated", "lowercase-global" },
			},
			runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
		completion = {
			showWord = "Disable",
		},
		IntelliSense = {
			traceBeSetted = true,
			traceFieldInject = true,
			traceLocalSet = true,
			traceReturn = true,
		},
		hint = {
			arrayIndex = "Auto",
			enable = true,
			paramName = "All",
			paramType = true,
			setType = false,
		},
		hover = {
			enable = true,
			enumsLimit = 5,
			previewFields = 20,
			viewNumber = true,
			viewString = true,
			viewStringMax = 1000,
		},
		misc = { parameters = { "self" } },
		semantic = {
			annotation = true,
			enable = true,
			keyword = true,
			variable = true,
		},
		window = { progressBar = true, statusBar = true },
		format = { enable = true },
	},
})
