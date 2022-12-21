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

