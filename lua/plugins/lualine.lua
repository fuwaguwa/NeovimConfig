return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.theme = {
        normal = {
          a = { bg = "#b19cd9", fg = "#0f0a13", gui = "bold" },
          b = { bg = "none", fg = "#b19cd9" },
          c = { bg = "none", fg = "#a898c9" },
        },
        insert = {
          a = { bg = "#ff7eb3", fg = "#0f0a13", gui = "bold" },
          b = { bg = "none", fg = "#ff7eb3" },
        },
        visual = {
          a = { bg = "#89c9d9", fg = "#0f0a13", gui = "bold" },
          b = { bg = "none", fg = "#89c9d9" },
        },
        replace = {
          a = { bg = "#ff6b9d", fg = "#0f0a13", gui = "bold" },
          b = { bg = "none", fg = "#ff6b9d" },
        },
        command = {
          a = { bg = "#ffc48e", fg = "#0f0a13", gui = "bold" },
          b = { bg = "none", fg = "#ffc48e" },
        },
        inactive = {
          a = { bg = "none", fg = "#685889" },
          b = { bg = "none", fg = "#685889" },
          c = { bg = "none", fg = "#685889" },
        },
      }

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
        color = { fg = "#ff7eb3", gui = "bold" },
      })
    end,
  },
}
