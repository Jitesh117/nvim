# My Neovim Configuration

This Neovim configuration is based on the NvChad starter template, with additional Language Server Protocol (LSP) support for enhanced development experience.

## Features

- NvChad base configuration
- LSP support for:
  - Go:
    ```lua
    go = { "gofumpt", "goimports_reviser", "golines" }
    ```
  - Python:
    ```lua
    python = { "black" }
    ```
  - Web Development:
    ```lua
    javascript = { "prettierd" }
    javascriptreact = { "prettierd" }
    typescript = { "prettierd" }
    typescriptreact = { "prettierd" }
    css = { "prettierd" }
    html = { "prettierd" }
    markdown = { "prettierd" }
    ```

## Getting Started

1. Install Neovim:
2. Clone this configuration:
   ```bash
   git clone https://github.com/jitesh117/nvim ~/.config/nvim/lua/custom
   ```
3. Run the following command inside Neovim to install all required language servers and formatters:
   ```vim
   :MasonInstallAll
   ```

Enjoy your enhanced Neovim experience!
