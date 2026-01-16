-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Close buffer
vim.keymap.set("n", "<M-q>", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })

-- Jump to buffer by number (Alt+1 through Alt+9) - safe version
for i = 1, 9 do
  vim.keymap.set("n", "<M-" .. i .. ">", function()
    local ok, bufferline = pcall(require, "bufferline")
    if ok then
      bufferline.go_to(i, true)
    else
      vim.cmd("buffer " .. i)
    end
  end, { desc = "Go to buffer " .. i })
end

vim.keymap.set("i", "<M-l>", "<Right>", { desc = "Move right in insert mode" })
vim.keymap.set("i", "<M-h>", "<Left>", { desc = "Move left in insert mode" })

-- Exit snippet placeholder
vim.keymap.set("i", "<C-j>", function()
  if vim.snippet and vim.snippet.active() then
    vim.snippet.stop()
  end
end, { desc = "Exit snippet placeholder" })

local terminals = {}

vim.keymap.set("n", "<leader>tf", function()
  terminals.last = "float"
  Snacks.terminal.toggle(nil, {
    win = { position = "float", backdrop = 60, height = 0.8, width = 0.8 },
    cwd = vim.fn.getcwd(),
  })
end, { desc = "Terminal Float" })

vim.keymap.set("n", "<leader>tr", function()
  terminals.last = "right"
  Snacks.terminal.toggle(nil, {
    win = { position = "right", width = 0.35 },
    cwd = vim.fn.getcwd(),
  })
end, { desc = "Terminal Right" })

vim.keymap.set({ "n", "t" }, "<C-/>", function()
  local pos = terminals.last or "float"
  local opts = {
    cwd = vim.fn.getcwd(),
  }

  if pos == "float" then
    opts.win = { position = "float", backdrop = 60, height = 0.8, width = 0.8 }
  elseif pos == "right" then
    opts.win = { position = "right", width = 0.35 }
  else
    opts.win = { position = "bottom", height = 0.4 }
  end

  Snacks.terminal.toggle(nil, opts)
end, { desc = "Toggle Last Terminal" })
