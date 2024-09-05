---@type LazySpec
return {
  {
    "akinsho/toggleterm.nvim",
    opts = {
      shell = "fish",
    },
  },

  {
    "folke/todo-comments.nvim",
    opts = {
      TODO = { icon = "✓ ", color = "info" },
      TODON = { icon = " ", color = "warning", alt = { "TODONEXT", "NEXT" } },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = "★ ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = "󰈙 ", color = "hint", alt = { "INFO" } },
      TEST = { icon = "✗ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
  },

  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        auto_trigger = true,
        debounce = 150,
        keymap = {
          accept = "<C-h>",
          accept_word = "<C-l>",
          accept_line = "<C-j>",
          next = "<C-o>",
          prev = "<C-i>",
          dismiss = "<C-c>",
        },
      },
    },
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      require("kanagawa").setup {
        transparent = true,
        terminal_colors = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
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
              TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_p1 },

              -- more uniform colors for the popup menu
              Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
              PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
              PmenuSbar = { bg = theme.ui.bg_m1 },
              PmenuThumb = { bg = theme.ui.bg_p2 },
            }
          end,
        },
      }
    end,
  },
}
