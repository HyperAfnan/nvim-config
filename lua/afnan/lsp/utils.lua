local M = {}

M.capabilities = function()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	local valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26 }

	capabilities = {
		textDocument = {
			callHierarchy = { dynamicRegistration = false },
			codeAction = {
				codeActionLiteralSupport = {
					codeActionKind = {
						valueSet = {
							"",
							"quickfix",
							"refactor",
							"refactor.extract",
							"refactor.inline",
							"refactor.rewrite",
							"source",
							"source.organizeImports",
						},
					},
				},
				dataSupport = true,
				dynamicRegistration = true,
				isPreferredSupport = true,
				resolveSupport = { properties = { "edit", "command" } },
			},
			completion = {
				completionItem = {
					deprecatedSupport = true,
					documentationFormat = { "markdown", "plaintext" },
					insertReplaceSupport = true,
					insertTextModeSupport = { valueSet = { 1, 2 } },
					resolveAdditionalTextEditsSupport = true,
					resolveSupport = {
						properties = {
							"documentation",
							"details",
							"additionalTextEdits",
							"command",
						},
					},
					snippetSupport = true,
				},
				contextSupport = true,
			},
			declaration = { linkSupport = true },
			definition = { linkSupport = true },
			documentLink = {
				dynamicRegistration = true,
				tooltipSupport = true,
			},
			documentSymbol = {
				hierarchicalDocumentSymbolSupport = true,
				symbolKind = {
					valueSet = valueSet,
				},
			},
			foldingRange = { dynamicRegistration = true },
			formatting = { dynamicRegistration = true },
			hover = { contentFormat = { "markdown", "plaintext" } },
			implementation = { linkSupport = true },
			linkedEditingRange = { dynamicRegistration = true },
			publishDiagnostics = {
				relatedInformation = true,
				tagSupport = { valueSet = { 1, 2 } },
				versionSupport = true,
			},
			rangeFormatting = { dynamicRegistration = true },
			rename = {
				dynamicRegistration = true,
				prepareSupport = true,
			},
			signatureHelp = {
				signatureInformation = {
					parameterInformation = { labelOffsetSupport = true },
				},
			},
			synchronization = {
				didSave = true,
				willSave = true,
				willSaveWaitUntil = true,
			},
			typeDefinition = { linkSupport = true },
		},
		window = {
			showDocument = { support = true },
			workDoneProgress = true,
		},
		workspace = {
			applyEdit = true,
			codeLens = { refreshSupport = true },
			configuration = true,
			executeCommand = { dynamicRegistration = true },
			fileOperations = {
				didCreate = true,
				didDelete = true,
				didRename = true,
				willCreate = true,
				willDelete = true,
				willRename = true,
			},
			symbol = { symbolKind = { valueSet = valueSet } },
			workspaceEdit = {
				documentChanges = true,
				resourceOperations = { "create", "rename", "delete" },
			},
			workspaceFolders = true,
		},
	}

	return capabilities
end

M.on_attach = function(client, bufnr)
	vim.notify("Language Server: " .. client.name .. " is started!", "INFO", {
		title = "Language Server Protocol",
		icon = "???",
		hide_from_history = true,
	})
	-- Disable formatting
	--[[ client.server_capabilities.document_formatting = false
	client.server_capabilities.document_range_formatting = false ]]

	local function set_keymap(mode, lhs, rhs)
		vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { silent = true, noremap = true })
	end

	set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>")
	set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
	set_keymap("n", "gI", ":lua vim.lsp.buf.implementation()<CR>")
	set_keymap("n", "gk", ":lua vim.diagnostic.goto_next()<CR>")
	set_keymap("n", "gj", ":lua vim.diagnostic.goto_prev()<CR>")
	set_keymap("n", "gR", ":lua vim.lsp.buf.references()<CR>")
	set_keymap("n", "gr", ":lua vim.lsp.buf.rename()<CR>")
	set_keymap("n", "ga", ":lua vim.lsp.buf.code_action()<CR>")
	set_keymap("i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

	-- document highlights
	if client.server_capabilities.document_highlight then
		vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
		vim.api.nvim_create_autocmd("CursorHold", {
			callback = function()
				vim.lsp.buf.document_highlight()
			end,
			buffer = bufnr,
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			callback = function()
				vim.lsp.buf.clear_references()
			end,
			buffer = bufnr,
		})
	end
end

M.borders = function()
	return { " ", " ", " ", " ", " ", " ", " ", " " }
end

M.diagnosticsCode = function()
	return {
		no_matching_function = {
			message = "??? Can't find a matching function",
			"redundant-parameter",
			"ovl_no_viable_function_in_call",
		},
		empty_block = { message = "??? That shouldn't be empty here", "empty-block" },
		missing_symbol = {
			message = "??? Here should be a symbol",
			"miss-symbol",
		},
		expected_semi_colon = {
			message = "??? Remember the `;` or `,`",
			"expected_semi_declaration",
			"miss-sep-in-table",
			"invalid_token_after_toplevel_declarator",
		},
		redefinition = {
			message = "??? That variable was defined before",
			"redefinition",
			"redefined-local",
		},
		no_matching_variable = {
			message = "??? Can't find that variable",
			"undefined-global",
			"reportUndefinedVariable",
		},
		trailing_whitespace = {
			message = "??? Remove trailing whitespace",
			"trailing-whitespace",
			"trailing-space",
		},
		unused_variable = {
			message = "??? Don't define variables you don't use",
			"unused-local",
		},
		unused_function = {
			message = "??? Don't define functions you don't use",
			"unused-function",
		},
		useless_symbols = {
			message = "??? Remove that useless symbols",
			"unknown-symbol",
		},
		wrong_type = {
			message = "??? Try to use the correct types",
			"init_conversion_failed",
		},
		undeclared_variable = {
			message = "??? Have you delcared that variable somewhere?",
			"undeclared_var_use",
		},
		lowercase_global = {
			message = "??? Should that be a global? (if so make it uppercase)",
			"lowercase-global",
		},
	}
end

M.kind = function()
	return {
		Text = " ??? ",
		Method = " ??? ",
		Function = " ??? ",
		Constructor = " ??? ",
		Field = " ??? ",
		Variable = "[???]",
		Class = " ??? ",
		Interface = " ??? ",
		Module = " ??? ",
		Property = " ??? ",
		Unit = " ??? ",
		Value = " ??? ",
		Enum = " ??? ",
		Keyword = " ??? ",
		Snippet = " ??? ",
		Color = " ??? ",
		File = " ??? ",
		Reference = " ??? ",
		Folder = " ??? ",
		EnumMember = " ??? ",
		Constant = " ??? ",
		Struct = " ??? ",
		Event = " ??? ",
		Operator = " ??? ",
		TypeParameter = " ??? ",
	}
end

return M
