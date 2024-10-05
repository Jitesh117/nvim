-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

local options = {
  base46 = {
    theme = "chadracula-evondev",
    -- transparency = true,
    hl_override = {
      NvDashAscii = {
        bg = "NONE",
        fg = "baby_pink",
      },
      NvDashButtons = {
        bg = "NONE",
        fg = "white",
      },
    },
  },
  nvdash = {
    load_on_startup = true,
    header = {
      [[    ██╗   ██╗███████╗ ██████╗ ██████╗ ██████╗ ███████╗ ]],
      [[    ██║   ██║██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔════╝ ]],
      [[    ██║   ██║███████╗██║     ██║   ██║██║  ██║█████╗   ]],
      [[    ╚██╗ ██╔╝╚════██║██║     ██║   ██║██║  ██║██╔══╝   ]],
      [[     ╚████╔╝ ███████║╚██████╗╚██████╔╝██████╔╝███████╗ ]],
      [[      ╚═══╝  ╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝ ]],
      [[                                                       ]],
    },
    buttons = {
      {
        txt = "  Restore Session",
        keys = "Spc q s",
        cmd = function()
          require("persistence").load()
        end,
      },
      { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
      { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
      { txt = "󰈭  Find Word", keys = "Spc f w", cmd = "Telescope live_grep" },
      { txt = "󱥚  Themes", keys = "Spc t h", cmd = "Telescope themes" },
      { txt = "  Mappings", keys = "Spc c h", cmd = "NvCheatsheet" },

      { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },

      {
        txt = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime) .. " ms"
          return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
        end,
        hl = "NvDashLazy",
        no_gap = true,
      },

      { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
    },
  },
  mason = {
    pkgs = {
      -- go stuff
      "gopls",
      "gofumpt",
      "golines",
      "goimports",
      "goimports-reviser",
      -- python stuff
      "pyright",
      "black",
      "mypy",
      "ruff",
      "debugpy",
      -- web dev stuff
      "eslint-lsp",
      "prettier",
      "tailwindcss-language-server",
      "typescript-language-server",
      -- markdown
      "marksman",
      "clangd",
      "clang-format",
    },
  },
}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
