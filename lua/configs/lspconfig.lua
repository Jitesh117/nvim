-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local on_init = require("nvchad.configs.lspconfig").on_init

-- EXAMPLE
local servers = { "cssls" } -- removed html from here
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- HTML LSP with HEEx support
lspconfig.html.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "html", "heex" }, -- Add heex here
}

-- go LSP
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  -- root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      gofumpt = true,
    },
  },
}

local python_servers = {
  "pyright",
  "ruff",
}

for _, lsp in ipairs(python_servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "python" },
    root_dir = function(fname)
      -- return util.root_pattern("pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git")(fname) or util.path.dirname(fname)
    end,
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic", -- or "strict"
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",
        },
      },
    },
  }
end

-- TypeScript LSP
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Tailwind CSS LSP with HEEx support
lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
    "heex",
    "elixir",
    "eelixir",
  },
  root_dir = function(fname)
    local util = require("lspconfig.util")
    return util.root_pattern("tailwind.config.js", "tailwind.config.ts", "assets/css/app.css", "mix.exs")(fname)
  end,
  init_options = {
    userLanguages = {
      elixir = "html-eex",
      eelixir = "html-eex",
      heex = "html-eex",
    },
  },
  settings = {
    tailwindCSS = {
      includeLanguages = {
        elixir = "html",
        eelixir = "html",
        heex = "html",
      },
      experimental = {
        classRegex = {
          [[class: "([^"]*)]],
          [[class: '([^']*)]],
          '~H""".*class="([^"]*)".*"""',
          [[class="([^"]*)]],
        },
      },
      validate = true,
    },
  },
}

-- emmet lsp with HEEx support
lspconfig.emmet_language_server.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "pug",
    "typescript",
    "typescriptreact",
    "heex", -- Add heex here for Emmet support
  },
  init_options = {
    ---@type table<string, string>
    includeLanguages = {},
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
}

-- c & cpp setup
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
  on_init = on_init,
  capabilities = capabilities,
}

-- elixir LSP (ElixirLS)
lspconfig.elixirls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,

  cmd = { "elixir-ls" },
  filetypes = { "elixir", "eelixir", "heex" },

  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = false, -- set true if you want auto deps fetching
      enableTestLenses = true,
      suggestSpecs = true,
    },
  },
}

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
  callback = function()
    vim.lsp.codelens.refresh()
  end,
})
