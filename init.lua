vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

--
-- local function start_brainrot_lsp()
--   local filetype = vim.bo.filetype
--   if filetype == "text" or filetype == "markdown" then
--     vim.lsp.start {
--       name = "brainrot-lsp",
--       cmd = { "./bin/brainrot-lsp" },
--       root_dir = vim.fn.getcwd(),
--     }
--   end
-- end
--
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "*",
--   callback = start_brainrot_lsp,
-- })
