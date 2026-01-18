# My Neovim Configuration

This Neovim configuration is based on the NvChad starter template, with additional Language Server Protocol (LSP) support for enhanced development experience.

## Features

- NvChad base configuration
- LSP support for:

  - Go
  - Elixir/Heex
  - Python
  - C/C++
  - HTML
  - CSS
  - JS/JSX
  - TS/TSX
  - Tailwind

## Getting Started

1. Install Neovim. You can check out the official [docs](https://github.com/neovim/neovim/blob/master/INSTALL.md)
2. Clone this configuration:
   ```bash
   git clone https://github.com/jitesh117/nvim ~/.config/nvim && nvim
   ```
3. Run the following command inside Neovim to install all required language servers and formatters:
   ```vim
   :MasonInstallAll
   ```

Enjoy your enhanced Neovim experience!
