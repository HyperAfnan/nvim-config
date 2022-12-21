-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function("has", { "nvim-0.5" }) ~= 1 then
	vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
	return
end

vim.api.nvim_command("packadd packer.nvim")

local no_errors, error_msg = pcall(function()
	_G._packer = _G._packer or {}
	_G._packer.inside_compile = true

	local time
	local profile_info
	local should_profile = false
	if should_profile then
		local hrtime = vim.loop.hrtime
		profile_info = {}
		time = function(chunk, start)
			if start then
				profile_info[chunk] = hrtime()
			else
				profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
			end
		end
	else
		time = function(chunk, start) end
	end

	local function save_profiles(threshold)
		local sorted_times = {}
		for chunk_name, time_taken in pairs(profile_info) do
			sorted_times[#sorted_times + 1] = { chunk_name, time_taken }
		end
		table.sort(sorted_times, function(a, b)
			return a[2] > b[2]
		end)
		local results = {}
		for i, elem in ipairs(sorted_times) do
			if not threshold or threshold and elem[2] > threshold then
				results[i] = elem[1] .. " took " .. elem[2] .. "ms"
			end
		end
		if threshold then
			table.insert(results, "(Only showing plugins that took longer than " .. threshold .. " ms " .. "to load)")
		end

		_G._packer.profile_output = results
	end

	time([[Luarocks path setup]], true)
	local package_path_str =
		"/data/data/com.termux/files/home/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/data/data/com.termux/files/home/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/data/data/com.termux/files/home/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/data/data/com.termux/files/home/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
	local install_cpath_pattern =
		"/data/data/com.termux/files/home/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
	if not string.find(package.path, package_path_str, 1, true) then
		package.path = package.path .. ";" .. package_path_str
	end

	if not string.find(package.cpath, install_cpath_pattern, 1, true) then
		package.cpath = package.cpath .. ";" .. install_cpath_pattern
	end

	time([[Luarocks path setup]], false)
	time([[try_loadstring definition]], true)
	local function try_loadstring(s, component, name)
		local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
		if not success then
			vim.schedule(function()
				vim.api.nvim_notify(
					"packer.nvim: Error running " .. component .. " for " .. name .. ": " .. result,
					vim.log.levels.ERROR,
					{}
				)
			end)
		end
		return result
	end

	time([[try_loadstring definition]], false)
	time([[Defining packer_plugins]], true)
	_G.packer_plugins = {
		["Comment.nvim"] = {
			after = { "nvim-ts-context-commentstring" },
			config = { "require('afnan.comments')" },
			keys = { { "", "gcc" }, { "", "gc" }, { "", "gb" }, { "", "gbc" } },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
			url = "https://github.com/numToStr/Comment.nvim",
		},
		LuaSnip = {
			loaded = true,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/LuaSnip",
			url = "https://github.com/L3MON4D3/LuaSnip",
		},
		["cmp-buffer"] = {
			loaded = true,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/cmp-buffer",
			url = "https://github.com/hrsh7th/cmp-buffer",
		},
		["cmp-cmdline"] = {
			loaded = true,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
			url = "https://github.com/hrsh7th/cmp-cmdline",
		},
		["cmp-nvim-lsp"] = {
			loaded = true,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
			url = "https://github.com/hrsh7th/cmp-nvim-lsp",
		},
		["cmp-path"] = {
			loaded = true,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/cmp-path",
			url = "https://github.com/hrsh7th/cmp-path",
		},
		cmp_luasnip = {
			loaded = true,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
			url = "https://github.com/saadparwaiz1/cmp_luasnip",
		},
		["filetype.nvim"] = {
			config = {
				"\27LJ\2\nu\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\14overrides\1\0\0\fcomplex\1\0\0\1\0\1\16.luacheckrc\blua\nsetup\rfiletype\frequire\0",
			},
			loaded = true,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/filetype.nvim",
			url = "https://github.com/nathom/filetype.nvim",
		},
		["nvim-autopairs"] = {
			config = { "require('afnan.autopairs')" },
			load_after = {},
			loaded = true,
			needs_bufread = false,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
			url = "https://github.com/windwp/nvim-autopairs",
		},
		["nvim-cmp"] = {
			loaded = true,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-cmp",
			url = "https://github.com/hrsh7th/nvim-cmp",
		},
		["nvim-lspconfig"] = {
			loaded = true,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
			url = "https://github.com/neovim/nvim-lspconfig",
		},
		["nvim-treesitter"] = {
			after = { "nvim-ts-autotag" },
			config = { "require('afnan.treesitter')" },
			loaded = true,
			only_config = true,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
			url = "https://github.com/nvim-treesitter/nvim-treesitter",
		},
		["nvim-ts-autotag"] = {
			load_after = {},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
			url = "https://github.com/windwp/nvim-ts-autotag",
		},
		["nvim-ts-context-commentstring"] = {
			load_after = {
				["Comment.nvim"] = true,
			},
			loaded = false,
			needs_bufread = false,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
			url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
		},
		["nvim-ts-rainbow"] = {
			loaded = true,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
			url = "https://github.com/p00f/nvim-ts-rainbow",
		},
		["nvim-web-devicons"] = {
			loaded = true,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
			url = "https://github.com/kyazdani42/nvim-web-devicons",
		},
		["packer.nvim"] = {
			loaded = true,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/packer.nvim",
			url = "https://github.com/wbthomason/packer.nvim",
		},
		["plenary.nvim"] = {
			loaded = true,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/plenary.nvim",
			url = "https://github.com/nvim-lua/plenary.nvim",
		},
		["startuptime.vim"] = {
			commands = { "StartupTime" },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/opt/startuptime.vim",
			url = "https://github.com/tweekmonster/startuptime.vim",
		},
		["telescope.nvim"] = {
			loaded = true,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/telescope.nvim",
			url = "https://github.com/nvim-telescope/telescope.nvim",
		},
		["tokyonight.nvim"] = {
			config = {
				"\27LJ\2\n:\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\0",
			},
			loaded = true,
			path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
			url = "https://github.com/folke/tokyonight.nvim",
		},
	}

	time([[Defining packer_plugins]], false)
	-- Config for: tokyonight.nvim
	time([[Config for tokyonight.nvim]], true)
	try_loadstring(
		"\27LJ\2\n:\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\0",
		"config",
		"tokyonight.nvim"
	)
	time([[Config for tokyonight.nvim]], false)
	-- Config for: nvim-treesitter
	time([[Config for nvim-treesitter]], true)
	require("afnan.treesitter")
	time([[Config for nvim-treesitter]], false)
	-- Config for: filetype.nvim
	time([[Config for filetype.nvim]], true)
	try_loadstring(
		"\27LJ\2\nu\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\14overrides\1\0\0\fcomplex\1\0\0\1\0\1\16.luacheckrc\blua\nsetup\rfiletype\frequire\0",
		"config",
		"filetype.nvim"
	)
	time([[Config for filetype.nvim]], false)
	-- Load plugins in order defined by `after`
	time([[Sequenced loading]], true)
	vim.cmd([[ packadd nvim-cmp ]])
	vim.cmd([[ packadd nvim-autopairs ]])

	-- Config for: nvim-autopairs
	require("afnan.autopairs")

	time([[Sequenced loading]], false)

	-- Command lazy-loads
	time([[Defining lazy-load commands]], true)
	pcall(vim.api.nvim_create_user_command, "StartupTime", function(cmdargs)
		require("packer.load")(
			{ "startuptime.vim" },
			{
				cmd = "StartupTime",
				l1 = cmdargs.line1,
				l2 = cmdargs.line2,
				bang = cmdargs.bang,
				args = cmdargs.args,
				mods = cmdargs.mods,
			},
			_G.packer_plugins
		)
	end, {
		nargs = "*",
		range = true,
		bang = true,
		complete = function()
			require("packer.load")({ "startuptime.vim" }, { cmd = "StartupTime" }, _G.packer_plugins)
			return vim.fn.getcompletion("StartupTime ", "cmdline")
		end,
	})
	time([[Defining lazy-load commands]], false)

	-- Keymap lazy-loads
	time([[Defining lazy-load keymaps]], true)
	vim.cmd([[noremap <silent> gbc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gbc", prefix = "" }, _G.packer_plugins)<cr>]])
	vim.cmd([[noremap <silent> gc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]])
	vim.cmd([[noremap <silent> gb <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gb", prefix = "" }, _G.packer_plugins)<cr>]])
	vim.cmd([[noremap <silent> gcc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gcc", prefix = "" }, _G.packer_plugins)<cr>]])
	time([[Defining lazy-load keymaps]], false)

	vim.cmd([[augroup packer_load_aucmds]])
	vim.cmd([[au!]])
	-- Filetype lazy-loads
	time([[Defining lazy-load filetype autocommands]], true)
	vim.cmd([[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]])
	vim.cmd([[au FileType javascript ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "javascript" }, _G.packer_plugins)]])
	vim.cmd([[au FileType javascriptreact ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "javascriptreact" }, _G.packer_plugins)]])
	time([[Defining lazy-load filetype autocommands]], false)
	vim.cmd("augroup END")

	_G._packer.inside_compile = false
	if _G._packer.needs_bufread == true then
		vim.cmd("doautocmd BufRead")
	end
	_G._packer.needs_bufread = false

	if should_profile then
		save_profiles()
	end
end)

if not no_errors then
	error_msg = error_msg:gsub('"', '\\"')
	vim.api.nvim_command(
		'echohl ErrorMsg | echom "Error in packer_compiled: '
			.. error_msg
			.. '" | echom "Please check your config for correctness" | echohl None'
	)
end
