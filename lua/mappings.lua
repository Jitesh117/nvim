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

vim.keymap.set("i", "<C-h>", "<C-w>", { desc = "Delete the whole word in insert mode" })

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

map({ "n", "t" }, "<leader>tv", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal vertical toggle" })

map({ "n", "t" }, "<leader>tt", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal horizontal toggle" })



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

-- menu mappings
-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
  require("menu").open "default"
end, {})

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

-- codeforces directory creation keybinding

vim.keymap.set("n", "<leader>cf", function()
  local cwd = vim.fn.getcwd()
  local raw_name = vim.fn.input "Enter the problem name: "
  if raw_name == "" then
    print "No filename entered"
    return
  end

  local safe_name = string.gsub(raw_name, "%s+", "_")

  local folder_path = cwd .. "/" .. safe_name
  local main_file = folder_path .. "/" .. safe_name .. ".cpp"

  local tests_folder = folder_path .. "/tests"
  local input_file = tests_folder .. "/input.txt"
  local output_file = tests_folder .. "/output.txt"

  vim.fn.mkdir(folder_path, "p")
  vim.fn.mkdir(tests_folder, "p")

  if vim.fn.filereadable(main_file) == 0 then
    local template_file = cwd .. "/template.cpp"
    if vim.fn.filereadable(template_file) == 1 then
      local content = vim.fn.readfile(template_file)
      vim.fn.writefile(content, main_file)
    else
      vim.fn.writefile({}, main_file)
    end
  end

  if vim.fn.filereadable(input_file) == 0 then
    vim.fn.writefile({}, input_file)
  end
  if vim.fn.filereadable(output_file) == 0 then
    vim.fn.writefile({}, output_file)
  end

  vim.cmd("edit " .. main_file)
  vim.cmd("vsplit " .. input_file)
  vim.cmd("split " .. output_file)
  vim.cmd "wincmd h"
end, { desc = "Create new C++ problem folder with template and tests" })


-- insert @spec suggestion
vim.keymap.set("n", "<leader>es", function()
  vim.lsp.codelens.run()
end, { desc = "Elixir insert @spec" })
