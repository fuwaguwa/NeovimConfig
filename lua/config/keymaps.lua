vim.keymap.set("i", "<C-j>", function()
  if vim.snippet and vim.snippet.active() then
    vim.snippet.stop()
  end
end, { desc = "Exit snippet placeholder" })
vim.keymap.set("i", "<C-x>", "<Esc>", { noremap = true, silent = true })
