return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- Add LSP clients to statusline
      table.insert(opts.sections.lualine_x, 1, {
        function()
          local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
          if #buf_clients == 0 then
            return "LSP Inactive"
          end

          local buf_client_names = {}
          for _, client in pairs(buf_clients) do
            if client.name ~= "null-ls" and client.name ~= "copilot" then
              table.insert(buf_client_names, client.name)
            end
          end

          return "[" .. table.concat(buf_client_names, ", ") .. "]"
        end,
        icon = "",
        color = { gui = "bold" },
      })
    end,
  },
}
