return {
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
      ["mo"] = { "o<Esc>k", desc = "Add empty line below" },
      ["mO"] = { "O<Esc>j", desc = "Add empty line above" },
      ["<leader>a"] = { "ggVG", desc = "Switch to visual mode and select all." }
    },
    i = {
      ["kj"] = { "<Esc><cmd>wa<cr>", desc = "Exit insert mode and write all changed files" },
    },
  },
  options = {
    opt = {
      showtabline = 0
    },
  },
  plugins = {
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        opts.winbar = nil
        return opts
      end
    },
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "User AstroFile",
      opts = { suggestion = { auto_trigger = true, debounce = 150 } },
    },
    {
      "ur4ltz/surround.nvim",
      config = function()
        require "surround".setup { mappings_style = "surround" }
      end,
      lazy = false,
    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section @ https://github.com/folke/todo-comments.nvim
      }
    },
    { -- override nvim-cmp plugin
      "hrsh7th/nvim-cmp",
      dependencies = {
        "zbirenbaum/copilot.lua", -- add cmp source as dependency of cmp
      },
      -- override the options table that is used in the `require("cmp").setup()` call
      opts = function(_, opts)
        -- opts parameter is the default options table
        -- the function is lazy loaded so cmp is able to be required
        local cmp = require "cmp"
        -- modify the sources part of the options table
        opts.sources = cmp.config.sources {
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip",  priority = 750 },
          { name = "copilot",  priority = 700 }, -- new source
          { name = "buffer",   priority = 500 },
          { name = "path",     priority = 250 },
        }

        local copilot = require "copilot.suggestion"
        opts.mapping["<C-i>"] = cmp.mapping(function()
          if copilot.is_visible() then copilot.next() end
        end)

        opts.mapping["<C-o>"] = cmp.mapping(function()
          if copilot.is_visible() then copilot.prev() end
        end)

        opts.mapping["<C-l>"] = cmp.mapping(function()
          if copilot.is_visible() then copilot.accept_word() end
        end)

        opts.mapping["<C-j>"] = cmp.mapping(function()
          if copilot.is_visible() then copilot.accept_line() end
        end)

        opts.mapping["<C-h>"] = cmp.mapping(function()
          if copilot.is_visible() then copilot.accept() end
        end)

        opts.mapping["<C-c>"] = cmp.mapping(function()
          if copilot.is_visible() then copilot.dismiss() end
        end)
        -- return the new table to be used
        return opts
      end,
    },
    {
      "rebelot/kanagawa.nvim",
      lazy = false,
      config = function()
        require("kanagawa").setup({
          transparent = true,
          terminal_colors = true,
          colors = {
            theme = {
              all = {
                ui = {
                  bg_gutter = "none"
                }
              }
            },
            overrides = function(colors)
              local theme = colors.theme
              return {
                NormalFloat = { bg = "none" },
                FloatBorder = { bg = "none" },
                FloatTitle = { bg = "none" },

                -- Save an hlgroup with dark background and dimmed foreground
                -- so that you can use it where your still want darker windows.
                -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

                -- Popular plugins that open floats will link to NormalFloat by default;
                -- set their background accordingly if you wish to keep them dark and borderless
                LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                TelescopeTitle = { fg = theme.ui.special, bold = true },
                TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

                -- more uniform colors for the popup menu
                Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
                PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                PmenuSbar = { bg = theme.ui.bg_m1 },
                PmenuThumb = { bg = theme.ui.bg_p2 },
              }
            end,
          }
        })
      end,
    } }
}
