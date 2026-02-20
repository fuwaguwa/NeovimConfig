vim.schedule(function()
  -- Indent lines
  vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#585b70", bg = "none" })
end)

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    require("blink.cmp").hide()
  end,
})
