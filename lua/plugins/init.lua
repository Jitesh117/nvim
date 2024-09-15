return {
    {
      "stevearc/conform.nvim",
      -- event = 'BufWritePre', -- uncomment for format on save
      opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
      "neovim/nvim-lspconfig",
      config = function()
        require "configs.lspconfig"
      end,
    },
    {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
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
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local opts = require "nvchad.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "go",
        "python"
      }
      return opts
    end
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },

  -- Wakatime
  { 'wakatime/vim-wakatime', lazy = false },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "olrtg/nvim-emmet",
    config = function()
      vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
    end,
  },

    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },
}
