local plugins = {
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
        "prettierd",
        "tailwindcss-language-server",
        "typescript-language-server",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"go", "python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
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
  -- {
  --   "OXY2DEV/markview.nvim",
  --   ft = "markdown",

  --   dependencies = {
  --       -- You may not need this if you don't lazy load
  --       -- Or if the parsers are in your $RUNTIMEPATH
  --       "nvim-treesitter/nvim-treesitter",

  --       "nvim-tree/nvim-web-devicons"
  --   },
  -- },
  -- {
  --   'MeanderingProgrammer/markdown.nvim',
  --   name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
  --   ft = "markdown",
  --   dependencies = {
  --       'nvim-treesitter/nvim-treesitter', -- Mandatory
  --       'nvim-tree/nvim-web-devicons', -- Optional but recommended
  --   },
  --   config = function()
  --       require('render-markdown').setup({})
  --   end,
  -- },

  -- Wakatime
  { 'wakatime/vim-wakatime', lazy = false },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
}
return plugins
