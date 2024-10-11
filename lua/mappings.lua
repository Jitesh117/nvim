require "nvchad.mappings"

local map = vim.keymap.set

-- General mappings
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "TMUX window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "TMUX window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "TMUX window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "TMUX window up" })

-- Use j and k as gj and gk
map("n", "j", "gj", { desc = "Move down by visual line" })
map("n", "k", "gk", { desc = "Move up by visual line" })
map("v", "j", "gj", { desc = "Move down by visual line" })
map("v", "k", "gk", { desc = "Move up by visual line" })

-- DAP mappings
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = " DAP Add breakpoint at line" })
map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "DAP Open debugging sidebar" })

-- DAP Go mappings
map("n", "<leader>dgt", function()
  require("dap-go").debug_test()
end, { desc = "DAP Debug go test" })
map("n", "<leader>dgl", function()
  require("dap-go").debug_last()
end, { desc = "DAP Debug last go test" })

-- Gopher mappings
map("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "Gopher Add json struct tags" })
map("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", { desc = "Gopher Add yaml struct tags" })

-- Persistence mappings
map("n", "<leader>qs", function()
  require("persistence").load()
end, { desc = "Persistence Restore Session" })
map("n", "<leader>ql", function()
  require("persistence").load { last = true }
end, { desc = "Persistence Restore Last Session" })
map("n", "<leader>qd", function()
  require("persistence").stop()
end, { desc = "Persistence Don't Save Current Session" })

-- LSP mappings

map("n", "<leader>lf", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "LSP Floating diagnostic" })

-- noice mappings
map("n", "<leader>nd", "<cmd>Noice dismiss <CR>", { desc = "Noice Messages dismiss" })
map("n", "<leader>nh", "<cmd>Noice history<CR>", { desc = "Noice View Message history" })
map("n", "<leader>nn", "<cmd>Noice toggle<CR>", { desc = "Noice View Notifications" })
map("n", "<leader>nl", "<cmd>Noice last<CR>", { desc = "Noice View last Noice message" })
map("n", "<leader>ne", "<cmd>Noice errors<CR>", { desc = "Noice View Noice errors" })
map("n", "<leader>nt", "<cmd>Noice enable<CR>", { desc = "Noice Enable Noice for current session" })
map("n", "<leader>nT", "<cmd>Noice disable<CR>", { desc = "Noice Disable Noice for current session" })
map("n", "<leader>ns", "<cmd>Noice stats<CR>", { desc = "Noice View Noice stats" })

-- gitsigns mappings
map("n", "<leader>ph", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Gitsigns Git preview hunk" })
map("n", "<leader>ph", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Gitsigns Preview hunk" })
map("n", "<leader>bl", "<cmd>Gitsigns blame_line<CR>", { desc = "Gitsigns Blame line" })
map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Gitsigns Toggle line blame" })
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "Gitsigns Diff this" })
map("n", "]h", "<cmd>Gitsigns next_hunk<CR>", { desc = "Gitsigns Next hunk" })
map("n", "[h", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Gitsigns Previous hunk" })

-- leetcode mappings
map("n", "<leader>lr", "<cmd>Leet run<CR>", { desc = "LeetCode Run tests" })
map("n", "<leader>ls", "<cmd>Leet submit<CR>", { desc = "LeetCode Submit solution" })
