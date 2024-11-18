require "nvchad.options"

-- add yours here!

local o = vim.opt
o.relativenumber = true
o.tabstop = 4
o.shiftwidth = 4
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "html" },
  callback = function()
    vim.opt_local.expandtab = true
  end,
})
require("gitsigns").setup {
  current_line_blame = true, -- Enable blame line by default
}
