-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

local options = {
  base46 = {
    theme = "catppuccin",
    transparency = false,
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
  ui = {
    nvdash = {
      load_on_startup = true,
      header = {
        [[                                                    ]],
        [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
        [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
        [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
        [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
        [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
        [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
        [[                                                    ]],
      },
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
    },
  },
}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
