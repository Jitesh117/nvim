local conform = require "conform"

local opts = {
  formatters_by_ft = {
    -- go stuff
    go = { "gofumpt", "goimports_reviser", "golines" },
    -- python stuff
    python = {
      "black",
    },
    -- web dev stuff
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    markdown = { "prettierd" },
  },

  format_on_save = {
    -- Enable format on save
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

conform.setup(opts)

-- Automatically format on save for any buffer that supports formatting
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    conform.format { bufnr = args.buf }
  end,
})

return opts
