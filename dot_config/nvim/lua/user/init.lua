-- Define the Lua function
local function substitute_with_confirmation()
	-- Get the pattern to be replaced from the user
	local pattern = vim.fn.input("Pattern to replace: ")
	if pattern == "" then
		return
	end

	-- Get the replacement text from the user
	local replacement = vim.fn.input("Replace with: ")

	-- Perform the substitution with confirmation
	vim.cmd(":%s/" .. pattern .. "/" .. replacement .. "/gc")
end

return {
	options = {
		opt = { scrolloff = 8 },
	},

	icons = {
		ActiveLSP = "",
		ActiveTS = "",
		ArrowLeft = "",
		ArrowRight = "",
		BufferClose = "󰅖",
		DapBreakpoint = "",
		DapBreakpointCondition = "",
		DapBreakpointRejected = "",
		DapLogPoint = ".>",
		DapStopped = "󰁕",
		DefaultFile = "󰈙",
		Diagnostic = "󰒡",
		DiagnosticError = "",
		DiagnosticHint = "󰌵",
		DiagnosticInfo = "󰋼",
		DiagnosticWarn = "",
		Ellipsis = "…",
		FileModified = "",
		FileReadOnly = "",
		FoldClosed = "",
		FoldOpened = "",
		FoldSeparator = " ",
		FolderClosed = "",
		FolderEmpty = "",
		FolderOpen = "",
		Git = "󰊢",
		GitAdd = "",
		GitBranch = "",
		GitChange = "",
		GitConflict = "",
		GitDelete = "",
		GitIgnored = "◌",
		GitRenamed = "➜",
		GitStaged = "✓",
		GitUnstaged = "✗",
		GitUntracked = "★",
		LSPLoaded = "",
		LSPLoading1 = "",
		LSPLoading2 = "󰀚",
		LSPLoading3 = "",
		MacroRecording = "",
		Paste = "󰅌",
		Search = "",
		Selected = "❯",
		Spellcheck = "󰓆",
		TabClose = "󰅙",
	},

	mappings = {
		n = {
			["<Leader>]"] = { "o<Esc>k", desc = "Add empty line below" },
			["<Leader>["] = { "O<Esc>j", desc = "Add empty line above" },
			["<Leader>a"] = { "ggVG", desc = "Switch to visual mode and select all" },
			["<Leader>rA"] = { substitute_with_confirmation },
		},
		i = {
			["kj"] = { "<Esc><cmd>wa<cr>", desc = "Exit insert mode and write all changed files" },
		},
	},

	plugins = {
		{
			"AstroNvim/astrocommunity",
			{ import = "astrocommunity.pack.typescript-all-in-one" },
			{ import = "astrocommunity.pack.json" },
			{ import = "astrocommunity.pack.toml" },
			{ import = "astrocommunity.pack.yaml" },
			{ import = "astrocommunity.pack.rust" },
			{ import = "astrocommunity.pack.svelte" },
			{ import = "astrocommunity.pack.html-css" },
			{ import = "astrocommunity.pack.markdown" },
			{ import = "astrocommunity.pack.tailwindcss" },
			{ import = "astrocommunity.pack.bash" },
			{ import = "astrocommunity.pack.lua" },
			{ import = "astrocommunity.pack.python" },
			{ import = "astrocommunity.pack.java" },
			{ import = "astrocommunity.pack.kotlin" },
			{ import = "astrocommunity.motion.nvim-surround" },
			{ import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
			{ import = "astrocommunity.editing-support.todo-comments-nvim" },
			{ import = "astrocommunity.editing-support.chatgpt-nvim" },
			{ import = "astrocommunity.editing-support.refactoring-nvim" },
			{ import = "astrocommunity.editing-support.zen-mode-nvim" },
			{ import = "astrocommunity.bars-and-lines.heirline-vscode-winbar" },
			{ import = "astrocommunity.completion.copilot-lua-cmp" },
			{ import = "astrocommunity.note-taking.obsidian-nvim" },
			{ import = "astrocommunity.color.twilight-nvim" },
		},
	},

	colorscheme = "kanagawa",
}
