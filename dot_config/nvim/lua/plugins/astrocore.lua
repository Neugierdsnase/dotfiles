-- Define the Lua function
local function substitute_with_confirmation()
  -- Get the pattern to be replaced from the user
  local pattern = vim.fn.input("Pattern to replace: ")
  if pattern == "" then return end

  -- Get the replacement text from the user
  local replacement = vim.fn.input("Replace with: ")

  -- Perform the substitution with confirmation
  vim.cmd(":%s/" .. pattern .. "/" .. replacement .. "/gc")
end

-- Map the keybinding to call the function
vim.api.nvim_set_keymap('n', '<leader>r', ':lua substitute_with_confirmation()<CR>', { noremap = true, silent = true })
---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        scrolloff = 8,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- Konsti's personal mappings
        mo = { "o<Esc>k", desc = "Add empty line below" },
        mO = { "O<Esc>j", desc = "Add empty line above" },
        ["<Leader>a"] = { "ggVG", desc = "Switch to visual mode and select all" },
        ["<Leader>gpt"] = { "<cmd>ChatGPT<cr>", desc = "Open ChatGPT client window" },
        ["<Leader>tz"] = {"<cmd>ZenMode<cr>", desc = "Toggle ZenMode"},
        ["<Leader>tw"] = {function() vim.wo.wrap = not vim.wo.wrap end, desc = "Toggle Text Wrapping"},

        ["<Leader>rA"] = {substitute_with_confirmation},

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      },
      i = {
        ["kj"] = { "<Esc><cmd>wa<cr>", desc = "Exit insert mode and write all changed files" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}